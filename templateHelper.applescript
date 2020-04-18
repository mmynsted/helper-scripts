(*
     Mark Mynsted 2020-04-18
     Growing Liberty LLC 
     Simplify providing values for placeholders used in templates
*)

use framework "Foundation"
use scripting additions

-- properties to make script more DRY
property ca : a reference to current application -- current application


(*
-- might want later to read in placeholders or configuration data
-- 
property NSJSONSerialization : a reference to ca's NSJSONSerialization -- marshal JSON
https://developer.apple.com/documentation/foundation/nsjsonserialization?language=occ

property NSString : a reference to ca's NSString -- immutable string
https://developer.apple.com/documentation/foundation/nsstring?language=objc

property NSUTF8StringEncoding : a reference to 4 -- 8-bit representation of Unicode characters
https://developer.apple.com/documentation/foundation/1497293-anonymous/nsutf8stringencoding?language=objc

property NSData : a reference to ca's NSData -- byte buffer
https://developer.apple.com/documentation/foundation/nsdata?language=objc
--
*)

-- want now
property NSDictionary : a reference to ca's NSDictionary -- immutable associative array
-- https://developer.apple.com/documentation/foundation/nsdictionary?language=objc

property NSMutableDictionary : a reference to ca's NSMutableDictionary -- mutable associative array
-- https://developer.apple.com/documentation/foundation/nsmutabledictionary?language=objc


on reviewPlaceholders(orig)
	-- make immutable dictionary with source
	set sDict to NSDictionary's dictionaryWithDictionary:orig
	
	-- make mutable dictionary for results
	set res to NSMutableDictionary's dictionary
	
	-- obtain keys from original record
	set keys to sDict's allKeys()
	
	-- loop over the items to be reviewed
	repeat with theKey in keys
		-- get the value for this key 
		set theRec to (sDict's valueForKey:theKey) as record
		
		-- display a dialog to capture changes to the value for the key
		set responseRec to display dialog (desc in theRec) default answer (val in theRec)
		-- set responseButtonName to the button returned of responseRec
		set responseText to the text returned of the responseRec
		
		-- add to NSMutableDictionary
		(res's setValue:responseText forKey:theKey)
	end repeat
	
	-- return the res as an AppleScript record
	return res as record
end reviewPlaceholders

<cfcomponent>
    <cffunction name="toCyrillic" returntype="string" access="public" static="true">
        <cfargument name="sourceString" type="string" required="true">

        <cfset replacements = {
            'A': 'А', 'B': 'Б', 'C': 'Ц', 'D': 'Д', 'E': 'Е', 'F': 'Ф', 'G': 'Г', 'H': 'Х', 
            'I': 'И', 'J': 'Ј', 'K': 'К', 'L': 'Л', 'M': 'М', 'N': 'Н', 'O': 'О', 'P': 'П', 
            'R': 'Р', 'S': 'С', 'T': 'Т', 'U': 'У', 'V': 'В', 'Z': 'З', 'a': 'а', 'b': 'б', 
            'c': 'ц', 'd': 'д', 'e': 'е', 'f': 'ф', 'g': 'г', 'h': 'х', 'i': 'и', 'j': 'ј', 
            'k': 'к', 'l': 'л', 'm': 'м', 'n': 'н', 'o': 'о', 'p': 'п', 'r': 'р', 's': 'с', 
            't': 'т', 'u': 'у', 'v': 'в', 'z': 'з', 'Č': 'Ч', 'č': 'ч', 'Š': 'Ш', 'š': 'ш', 
            'Ć': 'Ћ', 'ć': 'ћ', 'Đ': 'Ђ', 'Ð': 'Ђ', 'đ': 'ђ', 'Ž': 'Ж', 'ž': 'ж'
        }>
        
        <cfset digraphs = {
            'Dž': 'Џ', 'dž': 'џ', 'Nj': 'Њ', 'nj': 'њ', 'Lj': 'Љ', 'lj': 'љ'
        }>
    
        <cfset var returnString = "">
        <cfset var cnt = 0>
        <cfset var pl = len(arguments.sourceString)>
    
        <cfloop condition="cnt < pl">
            <cfset var c = mid(arguments.sourceString, cnt + 1, 1)>
            <cfset var c_nxt = (cnt + 1 < pl) ? mid(arguments.sourceString, cnt + 2, 1) : "">
    
            <cfif structKeyExists(digraphs, c & c_nxt)>
                <cfset returnString &= digraphs[c & c_nxt]>
                <cfset cnt++>
            <cfelse>
                <cfif structKeyExists(replacements, c)>
                    <cfset returnString &= replacements[c]>
                <cfelse>
                    <cfset returnString &= c>
                </cfif>
            </cfif>
    
            <cfset cnt++>
        </cfloop>
    
        <cfreturn returnString>
    </cffunction>
    
</cfcomponent>
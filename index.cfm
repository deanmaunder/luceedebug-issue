<cfoutput>
    hello world
    <cfset session.morethings = new MyObject() />
    <cfdump var="#session#" />
</cfoutput>
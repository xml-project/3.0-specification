<p:library xmlns:p="http://www.w3.org/ns/xproc"
           xmlns:e="http://www.w3.org/1999/XSL/Spec/ElementSyntax"
           version="1.0">
   <p:declare-step type="p:xsl-formatter" xml:id="xsl-formatter">
      <p:input port="source" content-types="application/xml text/xml */*+xml"/>
      <p:output port="result" content-types="*/*"/>
      <p:option name="parameters" as="xs:string"/>
      <p:option name="href" required="true" as="xs:anyURI"/>
      <p:option name="content-type" as="xs:string"/>
   </p:declare-step>
</p:library>

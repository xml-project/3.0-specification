<p:library xmlns:p="http://www.w3.org/ns/xproc"
           xmlns:e="http://www.w3.org/1999/XSL/Spec/ElementSyntax"
           version="1.0">
   <p:declare-step type="p:exec" xml:id="exec">
      <p:input port="source"
               primary="true"
               sequence="true"
               content-types="*/*"/>
      <p:output port="result" primary="true" content-types="*/*"/>
      <p:output port="errors"/>
      <p:output port="exit-status"/>
      <p:option name="command" required="true" as="xs:string"/>
      <p:option name="args" select="''" as="xs:string"/>
      <p:option name="cwd" as="xs:string"/>
      <p:option name="source-is-xml" select="true()" as="xs:boolean"/>
      <p:option name="result-is-xml" select="true()" as="xs:boolean"/>
      <p:option name="wrap-result-lines" select="false()" as="xs:boolean"/>
      <p:option name="errors-is-xml" select="false()" as="xs:boolean"/>
      <p:option name="wrap-error-lines" select="false()" as="xs:boolean"/>
      <p:option name="path-separator" as="xs:string"/>
      <p:option name="failure-threshold" as="xs:integer"/>
      <p:option name="arg-separator" select="' '" as="xs:string"/>
      <p:option name="serialization" as="xs:string"/>
   </p:declare-step>
</p:library>

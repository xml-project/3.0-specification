<p:library xmlns:p="http://www.w3.org/ns/xproc"
           xmlns:e="http://www.w3.org/1999/XSL/Spec/ElementSyntax"
           version="3.0">
   <p:declare-step type="p:add-attribute" xml:id="add-attribute">
      <p:input port="source" content-types="application/xml text/xml */*+xml"/>
      <p:output port="result" content-types="application/xml"/>
      <p:option name="match"
                as="xs:string"
                select="'/*'"
                e:type="XSLTSelectionPattern"/>
      <p:option name="attribute-name" required="true" as="xs:QName"/>
      <p:option name="attribute-prefix" as="xs:NCName?"/>
      <p:option name="attribute-namespace" as="xs:anyURI?"/>
      <p:option name="attribute-value" required="true" as="xs:string"/>
   </p:declare-step>
   <p:declare-step type="p:add-xml-base" xml:id="add-xml-base">
      <p:input port="source" content-types="application/xml text/xml */*+xml"/>
      <p:output port="result" content-types="application/xml"/>
      <p:option name="all" as="xs:boolean" select="false()"/>
      <p:option name="relative" as="xs:boolean" select="true()"/>
   </p:declare-step>
   <p:declare-step type="p:cast-content-type" xml:id="cast-content-type">
      <p:input port="source" content-types="*/*"/>
      <p:output port="result" content-types="*/*"/>
      <p:option name="content-type" required="true" as="xs:string"/>
      <p:option name="parameters" as="xs:string"/>
   </p:declare-step>
   <p:declare-step type="p:compare" xml:id="compare">
      <p:input port="source" primary="true" content-types="*/*"/>
      <p:input port="alternate" content-types="*/*"/>
      <p:output port="result" content-types="application/xml"/>
      <p:output port="differences" content-types="*/*" sequence="true"/>
      <p:option name="parameters" as="xs:string"/>
      <p:option name="method" as="xs:QName?"/>
      <p:option name="fail-if-not-equal" as="xs:boolean" select="false()"/>
   </p:declare-step>
   <p:declare-step type="p:count" xml:id="count">
      <p:input port="source" content-types="*/*" sequence="true"/>
      <p:output port="result" content-types="application/xml"/>
      <p:option name="limit" as="xs:integer" select="0"/>
   </p:declare-step>
   <p:declare-step type="p:delete" xml:id="delete">
      <p:input port="source" content-types="application/xml text/xml */*+xml"/>
      <p:output port="result" content-types="application/xml"/>
      <p:option name="match"
                required="true"
                as="xs:string"
                e:type="XSLTSelectionPattern"/>
   </p:declare-step>
   <p:declare-step type="p:directory-list" xml:id="directory-list">
      <p:output port="result" content-type="application/xml"/>
      <p:option name="path" required="true" as="xs:anyURI"/>
      <p:option name="detailed" as="xs:boolean" select="false()"/>
      <p:option name="include-filter" as="xs:string*" e:type="RegularExpression"/>
      <p:option name="exclude-filter" as="xs:string*" e:type="RegularExpression"/>
   </p:declare-step>
   <p:declare-step type="p:error" xml:id="error">
      <p:input port="source"
               sequence="true"
               content-types="application/xml text/xml */*+xml text/*"/>
      <p:output port="result"
                sequence="true"
                content-types="application/xml text/xml */*+xml text/*"/>
      <p:option name="code" required="true" as="xs:QName"/>
      <p:option name="code-prefix" as="xs:NCName?"/>
      <p:option name="code-namespace" as="xs:anyURI?"/>
   </p:declare-step>
   <p:declare-step type="p:escape-markup" xml:id="escape-markup">
      <p:input port="source" content-types="application/xml text/xml */*+xml"/>
      <p:output port="result" content-types="application/xml"/>
      <p:option name="serialization" as="xs:string"/>
   </p:declare-step>
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
   <p:declare-step type="p:file-copy" xml:id="file-copy">
      <p:output port="result" primary="true" content-types="application/xml"/>
      <p:option name="href" required="true" as="xs:anyURI"/>
      <p:option name="target" required="true" as="xs:anyURI"/>
      <p:option name="fail-on-error" as="xs:boolean" select="true()"/>
   </p:declare-step>
   <p:declare-step type="p:file-delete" xml:id="file-delete">
      <p:output port="result" primary="true" content-types="application/xml"/>
      <p:option name="href" required="true" as="xs:anyURI"/>
      <p:option name="recursive" as="xs:boolean" select="false()"/>
      <p:option name="fail-on-error" as="xs:boolean" select="true()"/>
   </p:declare-step>
   <p:declare-step type="p:file-head" xml:id="file-head">
      <p:output port="result" primary="true" content-types="application/xml"/>
      <p:option name="href" required="true" as="xs:anyURI"/>
      <p:option name="count" required="true" as="xs:integer"/>
      <p:option name="fail-on-error" as="xs:boolean" select="true()"/>
   </p:declare-step>
   <p:declare-step type="p:file-info" xml:id="file-info">
      <p:output port="result" primary="true" content-types="application/xml"/>
      <p:option name="href" required="true" as="xs:anyURI"/>
      <p:option name="fail-on-error" as="xs:boolean" select="true()"/>
   </p:declare-step>
   <p:declare-step type="p:file-mkdir" xml:id="file-mkdir">
      <p:output port="result" primary="true" content-types="application/xml"/>
      <p:option name="href" required="true" as="xs:anyURI"/>
      <p:option name="fail-on-error" as="xs:boolean" select="true()"/>
   </p:declare-step>
   <p:declare-step type="p:file-move" xml:id="file-move">
      <p:output port="result" primary="true" content-types="application/xml"/>
      <p:option name="href" required="true" as="xs:anyURI"/>
      <p:option name="target" required="true" as="xs:anyURI"/>
      <p:option name="fail-on-error" as="xs:boolean" select="true()"/>
   </p:declare-step>
   <p:declare-step type="p:file-tail" xml:id="file-tail">
      <p:output port="result" primary="true" content-types="application/xml"/>
      <p:option name="href" required="true" as="xs:anyURI"/>
      <p:option name="count" required="true" as="xs:integer"/>
      <p:option name="fail-on-error" as="xs:boolean" select="true()"/>
   </p:declare-step>
   <p:declare-step type="p:file-tempfile" xml:id="file-tempfile">
      <p:output port="result" primary="true" content-types="application/xml"/>
      <p:option name="href" as="xs:anyURI?"/>
      <p:option name="suffix" as="xs:string?"/>
      <p:option name="prefix" as="xs:string?"/>
      <p:option name="delete-on-exit" as="xs:boolean" select="false()"/>
      <p:option name="fail-on-error" as="xs:boolean" select="true()"/>
   </p:declare-step>
   <p:declare-step type="p:file-touch" xml:id="file-touch">
      <p:output port="result" primary="true" content-types="application/xml"/>
      <p:option name="href" required="true" as="xs:anyURI"/>
      <p:option name="timestamp" as="xs:dateTime?"/>
      <p:option name="fail-on-error" as="xs:boolean" select="true()"/>
   </p:declare-step>
   <p:declare-step type="p:filter" xml:id="filter">
      <p:input port="source" content-types="application/xml text/xml */*+xml"/>
      <p:output port="result" sequence="true" content-types="application/xml"/>
      <p:option name="select"
                required="true"
                as="xs:string"
                e:type="XPathExpression"/>
   </p:declare-step>
   <p:declare-step type="p:hash" xml:id="hash">
      <p:input port="source" primary="true" content-types="*/*"/>
      <p:output port="result" content-types="application/xml"/>
      <p:option name="parameters" as="xs:string"/>
      <p:option name="value" required="true" as="xs:string"/>
      <p:option name="algorithm" required="true" as="xs:QName"/>
      <p:option name="match"
                as="xs:string"
                select="'/*'"
                e:type="XSLTSelectionPattern"/>
      <p:option name="version" as="xs:string?"/>
   </p:declare-step>
   <p:declare-step type="p:http-request" xml:id="http-request">
      <p:input port="source" content-types="*/*"/>
      <p:output port="result" sequence="true" content-types="*/*"/>
      <p:option name="serialization" as="xs:string"/>
   </p:declare-step>
   <p:declare-step type="p:identity" xml:id="identity">
      <p:input port="source" sequence="true" content-types="*/*"/>
      <p:output port="result" sequence="true" content-types="*/*"/>
   </p:declare-step>
   <p:declare-step type="p:in-scope-names" xml:id="in-scope-names">
      <p:output port="result" content-types="application/xml"/>
   </p:declare-step>
   <p:declare-step type="p:insert" xml:id="insert">
      <p:input port="source"
               primary="true"
               content-types="application/xml text/xml */*+xml"/>
      <p:input port="insertion"
               sequence="true"
               content-types="application/xml text/* */*+xml"/>
      <p:output port="result" content-types="application/xml"/>
      <p:option name="match"
                as="xs:string"
                select="'/*'"
                e:type="XSLTSelectionPattern"/>
      <p:option name="position"
                required="true"
                as="xs:token"
                values="('first-child','last-child','before','after')"/>
   </p:declare-step>
   <p:declare-step type="p:label-elements" xml:id="label-elements">
      <p:input port="source" content-types="application/xml text/xml */*+xml"/>
      <p:output port="result" content-types="application/xml"/>
      <p:option name="attribute" as="xs:QName" select="'xml:id'"/>
      <p:option name="attribute-prefix" as="xs:NCName?"/>
      <p:option name="attribute-namespace" as="xs:anyURI?"/>
      <p:option name="label"
                as="xs:string"
                select="'concat(&#34;_&#34;,$p:index)'"
                e:type="XPathExpression"/>
      <p:option name="match"
                as="xs:string"
                select="'*'"
                e:type="XSLTSelectionPattern"/>
      <p:option name="replace" as="xs:boolean" select="true()"/>
   </p:declare-step>
   <p:declare-step type="p:load" xml:id="load">
      <p:output port="result" sequence="true" content-types="*/*"/>
      <p:option name="href" required="true" as="xs:anyURI"/>
      <p:option name="parameters" as="xs:string"/>
      <p:option name="content-type" as="xs:string?"/>
      <p:option name="document-properties" as="xs:string"/>
   </p:declare-step>
   <p:declare-step type="p:load-directory-list" xml:id="load-directory-list">
      <p:output port="result" content-type="application/xml"/>
      <p:option name="path" required="true" as="xs:anyURI"/>
      <p:option name="include-filter" as="xs:string*" e:type="RegularExpression"/>
      <p:option name="exclude-filter" as="xs:string*" e:type="RegularExpression"/>
   </p:declare-step>
   <p:declare-step type="p:make-absolute-uris" xml:id="make-absolute-uris">
      <p:input port="source" content-types="application/xml text/xml */*+xml"/>
      <p:output port="result" content-types="application/xml"/>
      <p:option name="match"
                required="true"
                as="xs:string"
                e:type="XSLTSelectionPattern"/>
      <p:option name="base-uri" as="xs:anyURI?"/>
   </p:declare-step>
   <p:declare-step type="p:namespace-rename" xml:id="namespace-rename">
      <p:input port="source" content-types="application/xml text/xml */*+xml"/>
      <p:output port="result" content-types="application/xml"/>
      <p:option name="from" required="true" as="xs:anyURI"/>
      <p:option name="to" required="true" as="xs:anyURI"/>
      <p:option name="apply-to"
                as="xs:token"
                select="'all'"
                values="('all','elements','attributes')"/>
   </p:declare-step>
   <p:declare-step type="p:os-cwd" xml:id="os-cwd">
      <p:output port="result" content-types="application/xml" primary="true"/>
   </p:declare-step>
   <p:declare-step type="p:os-env" xml:id="os-env">
      <p:output port="result" content-types="application/xml" primary="true"/>
   </p:declare-step>
   <p:declare-step type="p:os-info" xml:id="os-info">
      <p:output port="result" content-types="application/xml" primary="true"/>
   </p:declare-step>
   <p:declare-step type="p:pack" xml:id="pack">
      <p:input port="source"
               content-types="application/xml text/xml */*+xml"
               sequence="true"
               primary="true"/>
      <p:input port="alternate" sequence="true" content-types="application/xml"/>
      <p:output port="result" sequence="true"/>
      <p:option name="wrapper" required="true" as="xs:QName"/>
      <p:option name="wrapper-prefix" as="xs:NCName?"/>
      <p:option name="wrapper-namespace" as="xs:anyURI?"/>
   </p:declare-step>
   <p:declare-step type="p:parameters" xml:id="parameters">
      <p:output port="result" content-types="application/xml"/>
      <p:option name="parameters" as="xs:string"/>
   </p:declare-step>
   <p:declare-step type="p:rename" xml:id="rename">
      <p:input port="source" content-types="application/xml text/xml */*+xml"/>
      <p:output port="result" content-types="application/xml"/>
      <p:option name="match"
                as="xs:string"
                select="'/*'"
                e:type="XSLTSelectionPattern"/>
      <p:option name="new-name" required="true" as="xs:QName"/>
      <p:option name="new-prefix" as="xs:NCName?"/>
      <p:option name="new-namespace" as="xs:anyURI?"/>
   </p:declare-step>
   <p:declare-step type="p:replace" xml:id="replace">
      <p:input port="source"
               primary="true"
               content-types="application/xml text/xml */*+xml"/>
      <p:input port="replacement" content-types="application/xml text/xml */*+xml"/>
      <p:output port="result" content-types="application/xml"/>
      <p:option name="match"
                required="true"
                as="xs:string"
                e:type="XSLTSelectionPattern"/>
   </p:declare-step>
   <p:declare-step type="p:run" xml:id="run">
      <p:input port="source"
               primary="true"
               sequence="true"
               content-types="*/*"/>
      <p:output port="result" primary="true" content-types="*/*"/>
   </p:declare-step>
   <p:declare-step type="p:set-attributes" xml:id="set-attributes">
      <p:input port="source"
               primary="true"
               content-types="application/xml text/xml */*+xml"/>
      <p:input port="attributes" content-types="application/xml text/xml */*+xml"/>
      <p:output port="result" content-types="application/xml"/>
      <p:option name="match"
                as="xs:string"
                select="'/*'"
                e:type="XSLTSelectionPattern"/>
   </p:declare-step>
   <p:declare-step type="p:set-properties" xml:id="set-properties">
      <p:input port="source" content-types="*/*"/>
      <p:output port="result" content-types="*/*"/>
      <p:option name="properties" required="true" as="xs:string"/>
      <p:option name="merge" default="false()" as="xs:boolean"/>
   </p:declare-step>
   <p:declare-step type="p:sink" xml:id="sink">
      <p:input port="source" content-types="*/*" sequence="true"/>
   </p:declare-step>
   <p:declare-step type="p:split-sequence" xml:id="split-sequence">
      <p:input port="source"
               content-types="application/xml text/xml */*+xml"
               sequence="true"/>
      <p:output port="matched"
                sequence="true"
                primary="true"
                content-types="application/xml"/>
      <p:output port="not-matched" sequence="true" content-types="application/xml"/>
      <p:option name="initial-only" as="xs:boolean" select="false()"/>
      <p:option name="test"
                required="true"
                as="xs:string"
                e:type="XPathExpression"/>
   </p:declare-step>
   <p:declare-step type="p:store" xml:id="store">
      <p:input port="source" content-types="*/*"/>
      <p:output port="result" content-types="application/xml" primary="true"/>
      <p:option name="href" required="true" as="xs:anyURI"/>
      <p:option name="serialization" as="xs:string"/>
   </p:declare-step>
   <p:declare-step type="p:string-replace" xml:id="string-replace">
      <p:input port="source" content-types="application/xml text/xml */*+xml"/>
      <p:output port="result" content-types="application/xml"/>
      <p:option name="match"
                required="true"
                as="xs:string"
                e:type="XSLTSelectionPattern"/>
      <p:option name="replace"
                required="true"
                as="xs:string"
                e:type="XPathExpression"/>
   </p:declare-step>
   <p:declare-step type="p:tee" xml:id="tee">
      <p:input port="source" content-types="*/*" sequence="true"/>
      <p:output port="result" sequence="true" content-types="*/*"/>
      <p:option name="href" required="true" as="xs:anyURI"/>
      <p:option name="serialization" as="xs:string"/>
      <p:option name="enable" as="xs:boolean" select="true()"/>
   </p:declare-step>
   <p:declare-step type="p:unescape-markup" xml:id="unescape-markup">
      <p:input port="source" content-types="application/xml text/xml */*+xml text/*"/>
      <p:output port="result" content-types="application/xml text/xml */*+xml"/>
      <p:option name="namespace" as="xs:anyURI?"/>
      <p:option name="content-type" as="xs:string" select="'application/xml'"/>
      <p:option name="encoding" as="xs:string?"/>
      <p:option name="charset" as="xs:string?"/>
   </p:declare-step>
   <p:declare-step type="p:unwrap" xml:id="unwrap">
      <p:input port="source" content-types="application/xml text/xml */*+xml"/>
      <p:output port="result" content-types="application/xml"/>
      <p:option name="match"
                as="xs:string"
                select="'/*'"
                e:type="XSLTSelectionPattern"/>
   </p:declare-step>
   <p:declare-step type="p:uuid" xml:id="uuid">
      <p:input port="source"
               primary="true"
               content-types="application/xml text/xml */*+xml"/>
      <p:output port="result" content-types="application/xml"/>
      <p:option name="match"
                as="xs:string"
                select="'/*'"
                e:type="XSLTSelectionPattern"/>
      <p:option name="version" as="xs:integer?"/>
   </p:declare-step>
   <p:declare-step type="p:validate-with-relax-ng" xml:id="validate-with-relax-ng">
      <p:input port="source"
               primary="true"
               content-types="application/xml text/xml */*+xml"/>
      <p:input port="schema" content-types="application/xml */*+xml text/*"/>
      <p:output port="result" content-types="application/xml"/>
      <p:option name="dtd-attribute-values" select="false()" as="xs:boolean"/>
      <p:option name="dtd-id-idref-warnings" select="false()" as="xs:boolean"/>
      <p:option name="assert-valid" select="true()" as="xs:boolean"/>
   </p:declare-step>
   <p:declare-step type="p:validate-with-schematron" xml:id="validate-with-schematron">
      <p:input port="source"
               primary="true"
               content-types="application/xml text/xml */*+xml"/>
      <p:input port="schema" content-types="application/xml text/xml */*+xml"/>
      <p:output port="result" primary="true" content-types="application/xml"/>
      <p:output port="report" sequence="true" content-types="application/xml"/>
      <p:option name="parameters" as="xs:string"/>
      <p:option name="phase" select="'#ALL'" as="xs:string"/>
      <p:option name="assert-valid" select="true()" as="xs:boolean"/>
   </p:declare-step>
   <p:declare-step type="p:validate-with-xml-schema" xml:id="validate-with-xml-schema">
      <p:input port="source"
               primary="true"
               content-types="application/xml text/xml */*+xml"/>
      <p:input port="schema"
               sequence="true"
               content-types="application/xml text/xml */*+xml"/>
      <p:output port="result" content-types="application/xml"/>
      <p:option name="use-location-hints" select="false()" as="xs:boolean"/>
      <p:option name="try-namespaces" select="false()" as="xs:boolean"/>
      <p:option name="assert-valid" select="true()" as="xs:boolean"/>
      <p:option name="mode"
                select="'strict'"
                as="xs:token"
                values="('strict','lax')"/>
      <p:option name="version" as="xs:string?"/>
   </p:declare-step>
   <p:declare-step type="p:wrap" xml:id="wrap">
      <p:input port="source" content-types="application/xml text/xml */*+xml"/>
      <p:output port="result" content-types="application/xml"/>
      <p:option name="wrapper" required="true" as="xs:QName"/>
      <p:option name="wrapper-prefix" as="xs:NCName?"/>
      <p:option name="wrapper-namespace" as="xs:anyURI?"/>
      <p:option name="match"
                required="true"
                as="xs:string"
                e:type="XSLTSelectionPattern"/>
      <p:option name="group-adjacent" as="xs:string?" e:type="XPathExpression"/>
   </p:declare-step>
   <p:declare-step type="p:wrap-sequence" xml:id="wrap-sequence">
      <p:input port="source"
               content-types="application/xml */*+xml text/*"
               sequence="true"/>
      <p:output port="result" sequence="true" content-types="application/xml"/>
      <p:option name="wrapper" required="true" as="xs:QName"/>
      <p:option name="wrapper-prefix" as="xs:NCName?"/>
      <p:option name="wrapper-namespace" as="xs:anyURI?"/>
      <p:option name="group-adjacent" as="xs:string?" e:type="XPathExpression"/>
   </p:declare-step>
   <p:declare-step type="p:www-form-urldecode" xml:id="www-form-urldecode">
      <p:output port="result" content-types="application/xml"/>
      <p:option name="value" required="true" as="xs:string"/>
   </p:declare-step>
   <p:declare-step type="p:www-form-urlencode" xml:id="www-form-urlencode">
      <p:input port="source"
               primary="true"
               content-types="application/xml text/xml */*+xml"/>
      <p:output port="result" content-types="application/xml"/>
      <p:option name="parameters" as="xs:string"/>
      <p:option name="match"
                required="true"
                as="xs:string"
                e:type="XSLTSelectionPattern"/>
   </p:declare-step>
   <p:declare-step type="p:xinclude" xml:id="xinclude">
      <p:input port="source" content-types="application/xml text/xml */*+xml"/>
      <p:output port="result" content-types="application/xml text/xml */*+xml"/>
      <p:option name="fixup-xml-base" as="xs:boolean" select="false()"/>
      <p:option name="fixup-xml-lang" as="xs:boolean" select="false()"/>
   </p:declare-step>
   <p:declare-step type="p:xquery" xml:id="xquery">
      <p:input port="source"
               content-types="application/xml text/xml */*+xml"
               sequence="true"
               primary="true"/>
      <p:input port="query" content-types="application/xml */*+xml text/*"/>
      <p:output port="result" sequence="true" content-types="*/*"/>
      <p:option name="parameters" as="xs:string"/>
      <p:option name="version" as="xs:string?"/>
   </p:declare-step>
   <p:declare-step type="p:xsl-formatter" xml:id="xsl-formatter">
      <p:input port="source" content-types="application/xml text/xml */*+xml"/>
      <p:output port="result" content-types="*/*"/>
      <p:option name="parameters" as="xs:string"/>
      <p:option name="content-type" as="xs:string?"/>
   </p:declare-step>
   <p:declare-step type="p:xslt" xml:id="xslt">
      <p:input port="source"
               content-types="application/xml text/xml */*+xml"
               sequence="true"
               primary="true"/>
      <p:input port="stylesheet" content-types="application/xml text/xml */*+xml"/>
      <p:output port="result"
                primary="true"
                sequence="true"
                content-types="*/*"/>
      <p:output port="secondary" sequence="true"/>
      <p:option name="parameters" as="xs:string"/>
      <p:option name="initial-mode" as="xs:QName?"/>
      <p:option name="template-name" as="xs:QName?"/>
      <p:option name="output-base-uri" as="xs:anyURI?"/>
      <p:option name="version" as="xs:string?"/>
   </p:declare-step>
</p:library>

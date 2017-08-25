#!/bin/bash

cat <<EOF
<?xml version='1.0' encoding='UTF-8'?><feed xmlns='http://www.w3.org/2005/Atom' xmlns:apps='http://schemas.google.com/apps/2006'>
	<title>Mail Filters</title>
	<id>tag:mail.google.com,2008:filters:1503410306239</id>
	<updated>2017-08-22T14:00:37Z</updated>
	<author>
		<name>Ben Longden</name>
		<email>blongden@inviqa.com</email>
	</author>
EOF

split -l 70 domains.txt split-domain-
for x in split-domain-*; do
    cat <<EOF
	<entry>
		<category term='filter'></category>
		<title>Mail Filter</title>
		<id>tag:mail.google.com,2008:filter:1503410306239</id>
		<updated>2017-08-22T14:00:37Z</updated>
		<content></content>
EOF
    echo "<apps:property name='from' value='{" $(cat $x | tr '\n' ' ') "}' />"
    cat <<EOF
		<apps:property name='label' value='unsolicited/recruiter'/>
		<apps:property name='shouldArchive' value='true'/>
		<apps:property name='cannedResponse' value='tag:mail.google.com,2009:cannedResponse:15e0a0e625ad9eb3'/>
		<apps:property name='sizeOperator' value='s_sl'/>
		<apps:property name='sizeUnit' value='s_smb'/>
	</entry>
EOF
done
rm split-domain-*

cat <<EOF
	<entry>
		<category term='cannedResponse'></category>
		<title>spammy-recruiter</title>
		<id>tag:mail.google.com,2009:cannedResponse:15e0a0e625ad9eb3</id>
		<updated>2017-08-22T14:00:37Z</updated>
		<content type='html'>&lt;div dir="ltr"&gt;&lt;div&gt;Hi.&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;It looks like you&amp;#39;re a recruiter and you&amp;#39;ve sent me an unsolicited email.&lt;/div&gt;&lt;div&gt;This is an automated response to let you know that it has been flagged as spam and deleted without me ever seeing it.&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;The same thing will happen to further emails you send me. If this is a mistake and you are actually someone I work with on our recruitment needs then you&amp;#39;ll have my mobile number, give me a call to let me know.&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;If you&amp;#39;re wondering what this is all about, have a look here:&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;a href="https://github.com/drcongo/spammy-recruiters" target="_blank" data-saferedirecturl="https://www.google.com/url?hl=en-GB&amp;amp;q=https://github.com/drcongo/spammy-recruiters&amp;amp;source=gmail&amp;amp;ust=1503496837686000&amp;amp;usg=AFQjCNFP_A74tCzDKv7Ydi5yWvvHQtL1Cg"&gt;https://github.com/drcongo/&lt;wbr&gt;spammy-recruiters&lt;/a&gt;&lt;/div&gt;
&lt;/div&gt;</content>
	</entry>
</feed>
EOF


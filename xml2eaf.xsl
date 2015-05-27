<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="xs" version="2.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" omit-xml-declaration="no"/>
    <xsl:param name="Participant" required="yes"/>
    <xsl:template match="/">
        <ANNOTATION_DOCUMENT AUTHOR="unspecified" DATE="2014-09-08T16:00:59+01:00" FORMAT="2.8"
            VERSION="2.8" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
            xsi:noNamespaceSchemaLocation="http://www.mpi.nl/tools/elan/EAFv2.8.xsd">
            <HEADER MEDIA_FILE="" TIME_UNITS="milliseconds">
                <PROPERTY NAME="URN"
                    >urn:nl-mpi-tools-elan-eaf:61ee3117-e199-49ca-8258-9415d9cf90e1</PROPERTY>
                <PROPERTY NAME="lastUsedAnnotationId">1</PROPERTY>
            </HEADER>
            <TIME_ORDER>
                <xsl:for-each select="1 to xs:integer(count(//orthography))">
                    <TIME_SLOT TIME_SLOT_ID="ts{(position()-1)*2+1}"
                        TIME_VALUE="{(position() - 1)*10000}"/>
                    <TIME_SLOT TIME_SLOT_ID="ts{(position()-1)*2+2}"
                        TIME_VALUE="{(position() )*10000}"/>
                </xsl:for-each>
            </TIME_ORDER>
            <TIER DEFAULT_LOCALE="en" LINGUISTIC_TYPE_REF="refT" PARTICIPANT="{$Participant}"
                TIER_ID="ref@{$Participant}">
                <xsl:for-each select="//orthography">
                    <ANNOTATION>
                        <ALIGNABLE_ANNOTATION ANNOTATION_ID="a{position()}"
                            TIME_SLOT_REF1="ts{position()*2-1}" TIME_SLOT_REF2="ts{position()*2}">
                            <ANNOTATION_VALUE>
                                <xsl:value-of select="@ID"/>
                            </ANNOTATION_VALUE>
                        </ALIGNABLE_ANNOTATION>
                    </ANNOTATION>
                </xsl:for-each>
            </TIER>
            <TIER DEFAULT_LOCALE="en" LINGUISTIC_TYPE_REF="part(spoken)T" TIER_ID="part"/>
            <TIER DEFAULT_LOCALE="en" LINGUISTIC_TYPE_REF="geoT" TIER_ID="geo"/>
            <TIER DEFAULT_LOCALE="en" LINGUISTIC_TYPE_REF="bioT" TIER_ID="bio"/>
            <TIER DEFAULT_LOCALE="en" LINGUISTIC_TYPE_REF="commentT" TIER_ID="comment"/>
            <TIER DEFAULT_LOCALE="en" LINGUISTIC_TYPE_REF="noteT" PARENT_REF="part"
                TIER_ID="note(part)"/>
            <TIER DEFAULT_LOCALE="en" LINGUISTIC_TYPE_REF="phonet-upaT"
                PARENT_REF="ref@{$Participant}" PARTICIPANT="{$Participant}"
                TIER_ID="phonet-UPA@{$Participant}"/>
            <TIER DEFAULT_LOCALE="en" LINGUISTIC_TYPE_REF="phonol-cyrT"
                PARENT_REF="ref@{$Participant}" PARTICIPANT="{$Participant}"
                TIER_ID="phonol-CYR@{$Participant}"/>
            <TIER DEFAULT_LOCALE="en" LINGUISTIC_TYPE_REF="translit-latT"
                PARENT_REF="ref@{$Participant}" PARTICIPANT="{$Participant}"
                TIER_ID="translit-LAT@{$Participant}"/>
            <TIER DEFAULT_LOCALE="en" LINGUISTIC_TYPE_REF="noteT" PARENT_REF="ref@{$Participant}"
                PARTICIPANT="{$Participant}" TIER_ID="note(ref)@{$Participant}"/>
            <TIER DEFAULT_LOCALE="en" LINGUISTIC_TYPE_REF="orthT" PARENT_REF="ref@{$Participant}"
                PARTICIPANT="{$Participant}" TIER_ID="orth@{$Participant}">
                <xsl:for-each select="//orthography">
                    <ANNOTATION>
                        <REF_ANNOTATION ANNOTATION_ID="a{position() + count(//orthography)}"
                            ANNOTATION_REF="a{position()}">
                            <ANNOTATION_VALUE>
                                <xsl:value-of select="."/>
                            </ANNOTATION_VALUE>
                        </REF_ANNOTATION>
                    </ANNOTATION>
                </xsl:for-each>
            </TIER>
            <TIER DEFAULT_LOCALE="en" LINGUISTIC_TYPE_REF="phonet-ipaT"
                PARENT_REF="ref@{$Participant}" PARTICIPANT="{$Participant}"
                TIER_ID="phonet-IPA@{$Participant}"/>
            <TIER DEFAULT_LOCALE="en" LINGUISTIC_TYPE_REF="phonol-latT"
                PARENT_REF="ref@{$Participant}" PARTICIPANT="{$Participant}"
                TIER_ID="phonol-LAT@{$Participant}"/>
            <TIER DEFAULT_LOCALE="en" LINGUISTIC_TYPE_REF="noteT" PARENT_REF="geo"
                TIER_ID="note(geo)"/>
            <TIER DEFAULT_LOCALE="en" LINGUISTIC_TYPE_REF="noteT" PARENT_REF="bio"
                TIER_ID="note(bio)"/>
            <TIER DEFAULT_LOCALE="en" LINGUISTIC_TYPE_REF="wordT" PARENT_REF="orth@{$Participant}"
                PARTICIPANT="{$Participant}" TIER_ID="word@{$Participant}"/>
            <TIER DEFAULT_LOCALE="en" LINGUISTIC_TYPE_REF="ft-engT" PARENT_REF="orth@{$Participant}"
                PARTICIPANT="{$Participant}" TIER_ID="ft-eng@{$Participant}"/>
            <TIER DEFAULT_LOCALE="en" LINGUISTIC_TYPE_REF="ft-deuT" PARENT_REF="orth@{$Participant}"
                PARTICIPANT="{$Participant}" TIER_ID="ft-deu@{$Participant}"/>
            <TIER DEFAULT_LOCALE="en" LINGUISTIC_TYPE_REF="ft-nobT" PARENT_REF="orth@{$Participant}"
                PARTICIPANT="{$Participant}" TIER_ID="ft-nob@{$Participant}"/>
            <TIER DEFAULT_LOCALE="en" LINGUISTIC_TYPE_REF="ft-rusT" PARENT_REF="orth@{$Participant}"
                PARTICIPANT="{$Participant}" TIER_ID="ft-rus@{$Participant}">
                <xsl:for-each select="//ftrus">
                    <ANNOTATION>
                        <REF_ANNOTATION ANNOTATION_ID="a{position() + count(//orthography) + count(//orthography)}"
                            ANNOTATION_REF="a{position() + count(//orthography)}">
                            <ANNOTATION_VALUE>
                                <xsl:value-of select="."/>
                            </ANNOTATION_VALUE>
                        </REF_ANNOTATION>
                    </ANNOTATION>
                </xsl:for-each>
            </TIER>
            <TIER DEFAULT_LOCALE="en" LINGUISTIC_TYPE_REF="ft-sweT" PARENT_REF="orth@{$Participant}"
                PARTICIPANT="{$Participant}" TIER_ID="ft-swe@{$Participant}"/>
            <TIER DEFAULT_LOCALE="en" LINGUISTIC_TYPE_REF="ft-lingT"
                PARENT_REF="orth@{$Participant}" PARTICIPANT="{$Participant}"
                TIER_ID="ft-ling@{$Participant}"/>
            <TIER DEFAULT_LOCALE="en" LINGUISTIC_TYPE_REF="ft-finT" PARENT_REF="orth@{$Participant}"
                PARTICIPANT="{$Participant}" TIER_ID="ft-fin@{$Participant}"/>
            <TIER DEFAULT_LOCALE="en" LINGUISTIC_TYPE_REF="noteT" PARENT_REF="orth@{$Participant}"
                PARTICIPANT="{$Participant}" TIER_ID="note(orth)@{$Participant}"/>
            <TIER DEFAULT_LOCALE="en" LINGUISTIC_TYPE_REF="lgT" PARENT_REF="orth@{$Participant}"
                PARTICIPANT="{$Participant}" TIER_ID="lg(orth)@{$Participant}"/>
            <TIER DEFAULT_LOCALE="en" LINGUISTIC_TYPE_REF="lemmaT" PARENT_REF="word@{$Participant}"
                PARTICIPANT="{$Participant}" TIER_ID="lemma@{$Participant}"/>
            <TIER DEFAULT_LOCALE="en" LINGUISTIC_TYPE_REF="morphT" PARENT_REF="word@{$Participant}"
                PARTICIPANT="{$Participant}" TIER_ID="morph@{$Participant}"/>
            <TIER DEFAULT_LOCALE="en" LINGUISTIC_TYPE_REF="posT" PARENT_REF="word@{$Participant}"
                PARTICIPANT="{$Participant}" TIER_ID="pos@{$Participant}"/>
            <TIER DEFAULT_LOCALE="en" LINGUISTIC_TYPE_REF="lgT" PARENT_REF="word@{$Participant}"
                PARTICIPANT="{$Participant}" TIER_ID="lg(word)@{$Participant}"/>
            <TIER DEFAULT_LOCALE="en" LINGUISTIC_TYPE_REF="noteT" PARENT_REF="word@{$Participant}"
                PARTICIPANT="{$Participant}" TIER_ID="note(word)@{$Participant}"/>
            <LINGUISTIC_TYPE GRAPHIC_REFERENCES="false" LINGUISTIC_TYPE_ID="refT"
                TIME_ALIGNABLE="true"/>
            <LINGUISTIC_TYPE GRAPHIC_REFERENCES="false" LINGUISTIC_TYPE_ID="part(spoken)T"
                TIME_ALIGNABLE="true"/>
            <LINGUISTIC_TYPE EXT_REF="er1" GRAPHIC_REFERENCES="false" LINGUISTIC_TYPE_ID="geoT"
                TIME_ALIGNABLE="true"/>
            <LINGUISTIC_TYPE GRAPHIC_REFERENCES="false" LINGUISTIC_TYPE_ID="bioT"
                TIME_ALIGNABLE="true"/>
            <LINGUISTIC_TYPE GRAPHIC_REFERENCES="false" LINGUISTIC_TYPE_ID="commentT"
                TIME_ALIGNABLE="true"/>
            <LINGUISTIC_TYPE CONSTRAINTS="Symbolic_Association" GRAPHIC_REFERENCES="false"
                LINGUISTIC_TYPE_ID="noteT" TIME_ALIGNABLE="false"/>
            <LINGUISTIC_TYPE CONSTRAINTS="Symbolic_Association" GRAPHIC_REFERENCES="false"
                LINGUISTIC_TYPE_ID="phonet-upaT" TIME_ALIGNABLE="false"/>
            <LINGUISTIC_TYPE CONSTRAINTS="Symbolic_Association" GRAPHIC_REFERENCES="false"
                LINGUISTIC_TYPE_ID="phonol-cyrT" TIME_ALIGNABLE="false"/>
            <LINGUISTIC_TYPE CONSTRAINTS="Symbolic_Association" GRAPHIC_REFERENCES="false"
                LINGUISTIC_TYPE_ID="translit-latT" TIME_ALIGNABLE="false"/>
            <LINGUISTIC_TYPE CONSTRAINTS="Symbolic_Association" GRAPHIC_REFERENCES="false"
                LINGUISTIC_TYPE_ID="orthT" TIME_ALIGNABLE="false"/>
            <LINGUISTIC_TYPE CONSTRAINTS="Symbolic_Association" GRAPHIC_REFERENCES="false"
                LINGUISTIC_TYPE_ID="phonet-ipaT" TIME_ALIGNABLE="false"/>
            <LINGUISTIC_TYPE CONSTRAINTS="Symbolic_Association" GRAPHIC_REFERENCES="false"
                LINGUISTIC_TYPE_ID="phonol-latT" TIME_ALIGNABLE="false"/>
            <LINGUISTIC_TYPE CONSTRAINTS="Symbolic_Subdivision" GRAPHIC_REFERENCES="false"
                LINGUISTIC_TYPE_ID="wordT" TIME_ALIGNABLE="false"/>
            <LINGUISTIC_TYPE CONSTRAINTS="Symbolic_Association" GRAPHIC_REFERENCES="false"
                LINGUISTIC_TYPE_ID="ft-engT" TIME_ALIGNABLE="false"/>
            <LINGUISTIC_TYPE CONSTRAINTS="Symbolic_Association" GRAPHIC_REFERENCES="false"
                LINGUISTIC_TYPE_ID="ft-deuT" TIME_ALIGNABLE="false"/>
            <LINGUISTIC_TYPE CONSTRAINTS="Symbolic_Association" GRAPHIC_REFERENCES="false"
                LINGUISTIC_TYPE_ID="ft-nobT" TIME_ALIGNABLE="false"/>
            <LINGUISTIC_TYPE CONSTRAINTS="Symbolic_Association" GRAPHIC_REFERENCES="false"
                LINGUISTIC_TYPE_ID="ft-rusT" TIME_ALIGNABLE="false"/>
            <LINGUISTIC_TYPE CONSTRAINTS="Symbolic_Association" GRAPHIC_REFERENCES="false"
                LINGUISTIC_TYPE_ID="ft-sweT" TIME_ALIGNABLE="false"/>
            <LINGUISTIC_TYPE CONSTRAINTS="Symbolic_Association" GRAPHIC_REFERENCES="false"
                LINGUISTIC_TYPE_ID="ft-lingT" TIME_ALIGNABLE="false"/>
            <LINGUISTIC_TYPE CONSTRAINTS="Symbolic_Association" GRAPHIC_REFERENCES="false"
                LINGUISTIC_TYPE_ID="ft-finT" TIME_ALIGNABLE="false"/>
            <LINGUISTIC_TYPE CONSTRAINTS="Symbolic_Association" CONTROLLED_VOCABULARY_REF="lg"
                GRAPHIC_REFERENCES="false" LINGUISTIC_TYPE_ID="lgT" TIME_ALIGNABLE="false"/>
            <LINGUISTIC_TYPE CONSTRAINTS="Symbolic_Subdivision" GRAPHIC_REFERENCES="false"
                LINGUISTIC_TYPE_ID="lemmaT" TIME_ALIGNABLE="false"/>
            <LINGUISTIC_TYPE CONSTRAINTS="Symbolic_Subdivision" GRAPHIC_REFERENCES="false"
                LINGUISTIC_TYPE_ID="morphT" TIME_ALIGNABLE="false"/>
            <LINGUISTIC_TYPE CONSTRAINTS="Symbolic_Subdivision" CONTROLLED_VOCABULARY_REF="pos"
                GRAPHIC_REFERENCES="false" LINGUISTIC_TYPE_ID="posT" TIME_ALIGNABLE="false"/>
            <LOCALE COUNTRY_CODE="US" LANGUAGE_CODE="en"/>
            <LANGUAGE LANG_DEF="http://cdb.iso.org/lg/CDB-00130975-001" LANG_ID="und"
                LANG_LABEL="undetermined (und)"/>
            <CONSTRAINT
                DESCRIPTION="Time subdivision of parent annotation's time interval, no time gaps allowed within this interval"
                STEREOTYPE="Time_Subdivision"/>
            <CONSTRAINT
                DESCRIPTION="Symbolic subdivision of a parent annotation. Annotations refering to the same parent are ordered"
                STEREOTYPE="Symbolic_Subdivision"/>
            <CONSTRAINT DESCRIPTION="1-1 association with a parent annotation"
                STEREOTYPE="Symbolic_Association"/>
            <CONSTRAINT
                DESCRIPTION="Time alignable annotations within the parent annotation's time interval, gaps are allowed"
                STEREOTYPE="Included_In"/>
            <CONTROLLED_VOCABULARY CV_ID="lg">
                <DESCRIPTION LANG_REF="und">language</DESCRIPTION>
                <CV_ENTRY_ML CVE_ID="cveid0">
                    <CVE_VALUE DESCRIPTION="German" LANG_REF="und">deu</CVE_VALUE>
                </CV_ENTRY_ML>
                <CV_ENTRY_ML CVE_ID="cveid1">
                    <CVE_VALUE DESCRIPTION="Norwegian" LANG_REF="und">nob</CVE_VALUE>
                </CV_ENTRY_ML>
                <CV_ENTRY_ML CVE_ID="cveid2">
                    <CVE_VALUE DESCRIPTION="English" LANG_REF="und">eng</CVE_VALUE>
                </CV_ENTRY_ML>
                <CV_ENTRY_ML CVE_ID="cveid3">
                    <CVE_VALUE DESCRIPTION="Russian" LANG_REF="und">rus</CVE_VALUE>
                </CV_ENTRY_ML>
                <CV_ENTRY_ML CVE_ID="cveid4">
                    <CVE_VALUE DESCRIPTION="Swedish" LANG_REF="und">swe</CVE_VALUE>
                </CV_ENTRY_ML>
                <CV_ENTRY_ML CVE_ID="cveid5">
                    <CVE_VALUE DESCRIPTION="Kildin Saami" LANG_REF="und">sjd</CVE_VALUE>
                </CV_ENTRY_ML>
                <CV_ENTRY_ML CVE_ID="cveid6">
                    <CVE_VALUE DESCRIPTION="Ter Saami" LANG_REF="und">sjt</CVE_VALUE>
                </CV_ENTRY_ML>
                <CV_ENTRY_ML CVE_ID="cveid7">
                    <CVE_VALUE DESCRIPTION="Pite Saami" LANG_REF="und">sje</CVE_VALUE>
                </CV_ENTRY_ML>
                <CV_ENTRY_ML CVE_ID="cveid8">
                    <CVE_VALUE DESCRIPTION="Lule Saami" LANG_REF="und">smj</CVE_VALUE>
                </CV_ENTRY_ML>
                <CV_ENTRY_ML CVE_ID="cveid9">
                    <CVE_VALUE DESCRIPTION="North Saami" LANG_REF="und">sme</CVE_VALUE>
                </CV_ENTRY_ML>
                <CV_ENTRY_ML CVE_ID="cveid10">
                    <CVE_VALUE DESCRIPTION="Komi-Zyrian" LANG_REF="und">kpv</CVE_VALUE>
                </CV_ENTRY_ML>
            </CONTROLLED_VOCABULARY>
            <CONTROLLED_VOCABULARY CV_ID="pos">
                <DESCRIPTION LANG_REF="und">part of speech</DESCRIPTION>
                <CV_ENTRY_ML CVE_ID="cveid0">
                    <CVE_VALUE DESCRIPTION="adjective" LANG_REF="und">a</CVE_VALUE>
                </CV_ENTRY_ML>
                <CV_ENTRY_ML CVE_ID="cveid1">
                    <CVE_VALUE DESCRIPTION="abbreviation" LANG_REF="und">abbr</CVE_VALUE>
                </CV_ENTRY_ML>
                <CV_ENTRY_ML CVE_ID="cveid2">
                    <CVE_VALUE DESCRIPTION="preposition" LANG_REF="und">pre</CVE_VALUE>
                </CV_ENTRY_ML>
                <CV_ENTRY_ML CVE_ID="cveid3">
                    <CVE_VALUE DESCRIPTION="postposition" LANG_REF="und">post</CVE_VALUE>
                </CV_ENTRY_ML>
                <CV_ENTRY_ML CVE_ID="cveid4">
                    <CVE_VALUE DESCRIPTION="adverb" LANG_REF="und">adv</CVE_VALUE>
                </CV_ENTRY_ML>
                <CV_ENTRY_ML CVE_ID="cveid5">
                    <CVE_VALUE DESCRIPTION="coordinator" LANG_REF="und">cc</CVE_VALUE>
                </CV_ENTRY_ML>
                <CV_ENTRY_ML CVE_ID="cveid6">
                    <CVE_VALUE DESCRIPTION="subordinator" LANG_REF="und">cs</CVE_VALUE>
                </CV_ENTRY_ML>
                <CV_ENTRY_ML CVE_ID="cveid7">
                    <CVE_VALUE DESCRIPTION="determiner" LANG_REF="und">det</CVE_VALUE>
                </CV_ENTRY_ML>
                <CV_ENTRY_ML CVE_ID="cveid8">
                    <CVE_VALUE DESCRIPTION="interjection" LANG_REF="und">i</CVE_VALUE>
                </CV_ENTRY_ML>
                <CV_ENTRY_ML CVE_ID="cveid9">
                    <CVE_VALUE DESCRIPTION="noun" LANG_REF="und">n</CVE_VALUE>
                </CV_ENTRY_ML>
                <CV_ENTRY_ML CVE_ID="cveid10">
                    <CVE_VALUE DESCRIPTION="numeral" LANG_REF="und">num</CVE_VALUE>
                </CV_ENTRY_ML>
                <CV_ENTRY_ML CVE_ID="cveid11">http://cdb.iso.org/lg/CDB-00130975-001
                    <CVE_VALUE DESCRIPTION="particle" LANG_REF="und">pcle</CVE_VALUE>
                </CV_ENTRY_ML>
                <CV_ENTRY_ML CVE_ID="cveid12">
                    <CVE_VALUE DESCRIPTION="pronoun" LANG_REF="und">pro</CVE_VALUE>
                </CV_ENTRY_ML>
                <CV_ENTRY_ML CVE_ID="cveid13">
                    <CVE_VALUE DESCRIPTION="proper noun" LANG_REF="und">prop</CVE_VALUE>
                </CV_ENTRY_ML>
                <CV_ENTRY_ML CVE_ID="cveid14">
                    <CVE_VALUE DESCRIPTION="punctuation" LANG_REF="und">punct</CVE_VALUE>
                </CV_ENTRY_ML>
                <CV_ENTRY_ML CVE_ID="cveid15">
                    <CVE_VALUE DESCRIPTION="verb" LANG_REF="und">v</CVE_VALUE>
                </CV_ENTRY_ML>
            </CONTROLLED_VOCABULARY>
            <EXTERNAL_REF EXT_REF_ID="er1" TYPE="iso12620"
                VALUE="http://www.isocat.org/datcat/DC-2523"/>
        </ANNOTATION_DOCUMENT>
    </xsl:template>
</xsl:stylesheet>

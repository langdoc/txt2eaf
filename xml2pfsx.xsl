<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    xmlns:fmp="http://www.filemaker.com/fmpxmlresult"
    version="2.0">
    <xsl:param name="Participant" required="yes"/>
    <xsl:template match="/">
<preferences version="1.1" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:noNamespaceSchemaLocation="http://www.mpi.nl/tools/elan/Prefs_v1.1.xsd">
    <prefList key="MultiTierViewer.TierOrder"/>
    <pref key="LayoutManager.VisibleMultiTierViewer">
        <String>mpi.eudico.client.annotator.viewer.TimeLineViewer</String>
    </pref>
    <prefList key="CommentViewer.Columns.Order">
        <String>Start Time</String>
        <String>End Time</String>
        <String>Tier</String>
        <String>Initials</String>
        <String>Comment</String>
        <String>Thread</String>
        <String>Sender</String>
        <String>Recipient</String>
        <String>Creation Date</String>
        <String>Modification Date</String>
    </prefList>
    <pref key="LayoutManager.SplitPaneDividerLocation">
        <Int>2</Int>
    </pref>
    <pref key="LayoutManager.SelectedTabIndex">
        <Int>6</Int>
    </pref>
    <prefGroup key="TierColors">
        <pref key="geo">
            <Object class="java.awt.Color">0,0,160</Object>
        </pref>
        <pref key="bio">
            <Object class="java.awt.Color">90,160,90</Object>
        </pref>
        <pref key="ref@PK">
            <Object class="java.awt.Color">90,90,0</Object>
        </pref>
        <pref key="part">
            <Object class="java.awt.Color">160,0,160</Object>
        </pref>
        <pref key="comment">
            <Object class="java.awt.Color">0,160,0</Object>
        </pref>
<!--        <pref key="ref@ASI-F-1940">
            <Object class="java.awt.Color">90,160,0</Object>
        </pref> -->
    </prefGroup>
    <prefList key="CommentViewer.Columns.Hidden">
        <String>Sender</String>
        <String>Recipient</String>
    </prefList>
    <pref key="FrameLocation">
        <Object class="java.awt.Point">0,23</Object>
    </pref>
    <pref key="SelectionBeginTime">
        <Long>0</Long>
    </pref>
    <pref key="LayoutManager.CurrentMode">
        <Int>1</Int>
    </pref>
    <pref key="MediaTime">
        <Long>3520</Long>
    </pref>
    <pref key="MultiTierViewer.TierSortingMode">
        <Int>1</Int>
    </pref>
    <pref key="TimeLineViewer.ReducedTierHeight">
        <Boolean>true</Boolean>
    </pref>
    <pref key="FrameSize">
        <Object class="java.awt.Dimension">1280,773</Object>
    </pref>
    <pref key="MultiTierViewer.ActiveTierName">
        <String>part</String>
    </pref>
    <prefGroup key="CommentViewer.Columns">
        <pref key="Modification Date">
            <Int>75</Int>
        </pref>
        <pref key="Sender">
            <Int>0</Int>
        </pref>
        <pref key="Tier">
            <Int>75</Int>
        </pref>
        <pref key="Creation Date">
            <Int>75</Int>
        </pref>
        <pref key="Initials">
            <Int>75</Int>
        </pref>
        <pref key="Comment">
            <Int>75</Int>
        </pref>
        <pref key="End Time">
            <Int>75</Int>
        </pref>
        <pref key="Start Time">
            <Int>75</Int>
        </pref>
        <pref key="Recipient">
            <Int>0</Int>
        </pref>
        <pref key="Thread">
            <Int>75</Int>
        </pref>
    </prefGroup>
    <pref key="LayoutManager.ControlPanelWidth">
        <Int>213</Int>
    </pref>
    <pref key="TimeScaleBeginTime">
        <Long>-40</Long>
    </pref>
    <pref key="SelectionEndTime">
        <Long>0</Long>
    </pref>
        <prefList key="MultiTierViewer.HiddenTiers">
        <String>geo</String>
        <String>note(geo)</String>
        <String>bio</String>
        <String>note(bio)</String>
        <String>comment</String>
    </prefList>
</preferences>
</xsl:template>
</xsl:stylesheet>
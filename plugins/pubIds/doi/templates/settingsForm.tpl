{**
 * plugins/pubIds/doi/templates/settingsForm.tpl
 *
 * Copyright (c) 2014-2016 Simon Fraser University Library
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * DOI plugin settings
 *
 *}

<div id="description">{translate key="plugins.pubIds.doi.manager.settings.description"}</div>

<script src="{$baseUrl}/plugins/pubIds/doi/js/DOISettingsFormHandler.js"></script>
<script>
	$(function() {ldelim}
		// Attach the form handler.
		$('#doiSettingsForm').pkpHandler('$.pkp.plugins.pubIds.doi.js.DOISettingsFormHandler');
	{rdelim});
</script>
<form class="pkp_form" id="doiSettingsForm" method="post" action="{url router=$smarty.const.ROUTE_COMPONENT op="manage" category="pubIds" plugin=$pluginName verb="save"}">
	{include file="common/formErrors.tpl"}
	{fbvFormArea id="doiObjectsFormArea" title="plugins.pubIds.doi.manager.settings.doiObjects"}
		{fbvFormSection list="true"}
			<p class="pkp_help">{translate key="plugins.pubIds.doi.manager.settings.explainDois"}</p>
			{fbvElement type="checkbox" id="enableIssueDoi" label="plugins.pubIds.doi.manager.settings.enableIssueDoi" maxlength="40" checked=$enableIssueDoi|compare:true}
			{fbvElement type="checkbox" id="enableArticleDoi" label="plugins.pubIds.doi.manager.settings.enableArticleDoi" maxlength="40" checked=$enableArticleDoi|compare:true}
			{fbvElement type="checkbox" id="enableRepresentationDoi" label="plugins.pubIds.doi.manager.settings.enableRepresentationDoi" maxlength="40" checked=$enableRepresentationDoi|compare:true}
			{fbvElement type="checkbox" id="enableSubmissionFileDoi" label="plugins.pubIds.doi.manager.settings.enableSubmissionFileDoi" maxlength="40" checked=$enableSubmissionFileDoi|compare:true}
		{/fbvFormSection}
	{/fbvFormArea}
	{fbvFormArea id="doiPrefixFormArea" title="plugins.pubIds.doi.manager.settings.doiPrefix"}
		{fbvFormSection}
			<p class="pkp_help">{translate key="plugins.pubIds.doi.manager.settings.doiPrefix.description"}</p>
			{fbvElement type="text" id="doiPrefix" value=$doiPrefix required="true" label="plugins.pubIds.doi.manager.settings.doiPrefix" maxlength="40" size=$fbvStyles.size.MEDIUM}
		{/fbvFormSection}
	{/fbvFormArea}
	{fbvFormArea id="doiSuffixFormArea" title="plugins.pubIds.doi.manager.settings.doiSuffix"}
		<p class="pkp_help">{translate key="plugins.pubIds.doi.manager.settings.doiSuffix.description"}</p>
		{fbvFormSection list="true"}
			{if !in_array($doiSuffix, array("pattern", "customId"))}
				{assign var="checked" value=true}
			{else}
				{assign var="checked" value=false}
			{/if}
			{fbvElement type="radio" id="doiSuffixDefault" name="doiSuffix" value="default" required="true" label="plugins.pubIds.doi.manager.settings.doiSuffixDefault" checked=$checked}
			<span class="instruct">{translate key="plugins.pubIds.doi.manager.settings.doiSuffixDefault.description"}</span>
		{/fbvFormSection}
		{fbvFormSection list="true"}
			{if $doiSuffix eq "customId"}
				{assign var="checked" value=true}
			{else}
				{assign var="checked" value=false}
			{/if}
			{fbvElement type="radio" id="doiSuffixCustomId" name="doiSuffix" value="customId" required="true" label="plugins.pubIds.doi.manager.settings.doiSuffixCustomIdentifier" checked=$checked}
		{/fbvFormSection}
		{fbvFormSection list="true"}
			{if $doiSuffix eq "pattern"}
				{assign var="checked" value=true}
			{else}
				{assign var="checked" value=false}
			{/if}
			{fbvElement type="radio" id="doiSuffixPattern" name="doiSuffix" value="pattern" label="plugins.pubIds.doi.manager.settings.doiSuffixPattern" checked=$checked}
			<p class="pkp_help">{translate key="plugins.pubIds.doi.manager.settings.doiSuffixPattern.example"}</p>
			{fbvElement type="text" id="doiIssueSuffixPattern" value=$doiIssueSuffixPattern label="plugins.pubIds.doi.manager.settings.doiSuffixPattern.issues" maxlength="40" inline=true size=$fbvStyles.size.MEDIUM}
			{fbvElement type="text" id="doiArticleSuffixPattern" value=$doiArticleSuffixPattern label="plugins.pubIds.doi.manager.settings.doiSuffixPattern.articles" maxlength="40" inline=true size=$fbvStyles.size.MEDIUM}
			{fbvElement type="text" id="doiRepresentationSuffixPattern" value=$doiRepresentationSuffixPattern label="plugins.pubIds.doi.manager.settings.doiSuffixPattern.representations" maxlength="40" inline=true size=$fbvStyles.size.MEDIUM}
			{fbvElement type="text" id="doiSubmissionFileSuffixPattern" value=$doiSubmissionFileSuffixPattern label="plugins.pubIds.doi.manager.settings.doiSuffixPattern.submissionFiles" maxlength="40" inline=true size=$fbvStyles.size.MEDIUM}
		{/fbvFormSection}
	{/fbvFormArea}
	{fbvFormArea id="doiReassignFormArea" title="plugins.pubIds.doi.manager.settings.doiReassign"}
		{fbvFormSection}
			<span class="instruct">{translate key="plugins.pubIds.doi.manager.settings.doiReassign.description"}</span><br/>
			{include file="linkAction/linkAction.tpl" action=$clearPubIdsLinkAction contextId="doiSettingsForm"}
		{/fbvFormSection}
	{/fbvFormArea}
	{fbvFormButtons submitText="common.save"}
</form>
<p><span class="formRequired">{translate key="common.requiredField"}</span></p>

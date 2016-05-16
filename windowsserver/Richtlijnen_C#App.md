# Richtlijnen .NET Applicatie

## Publish.pubxml file

* Ga in de Solution Explorer naar de `Properties` sectie.
* Zoek in dit onderdeel de map `PublishProfiles`
* Maak in deze map volgend bestand aan: Publish.pubxml


```xml
<?xml version="1.0" encoding="utf-8"?>
<!--
This file is used by the publish/package process of your Web project. You can customize the behavior of this process
by editing this MSBuild file. In order to learn more about this please visit http://go.microsoft.com/fwlink/?LinkID=208121.
-->
<Project ToolsVersion="4.0" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
  <PropertyGroup>
    <WebPublishMethod>MSDeploy</WebPublishMethod>
    <SiteUrlToLaunchAfterPublish>http://localhost/{Naam van de webapp}</SiteUrlToLaunchAfterPublish>
    <MSDeployServiceURL>localhost</MSDeployServiceURL>
    <DeployIisAppPath>Default Web Site/{Naam van de webapp}</DeployIisAppPath>
    <RemoteSitePhysicalPath />
    <SkipExtraFilesOnServer>True</SkipExtraFilesOnServer>
    <DeployAsIisApp>True</DeployAsIisApp>
    <MSDeployPublishMethod>InProc</MSDeployPublishMethod>
    <UserName />
    <_SavePWD>False</_SavePWD>
    <PublishDatabaseSettings>
      <Objects xmlns="">
        <ObjectGroup Name="{Naam van de context-file}" Order="1" Enabled="True">
          <Destination Path="Data Source=|DataDirectory|{.sdf-file}" />
          <Object Type="DbCodeFirst">
            <Source Path="DBMigration" DbContext="{Naam van de Solution}.DAL.{Naam van de context-file}, {Naam van de .DAL-file}.DAL" MigrationConfiguration="{Naam van de Solution}.DAL.Migrations.Configuration, {Naam van de .DAL-file}.DAL" Origin="Configuration" />
          </Object>
        </ObjectGroup>
        <ObjectGroup Name="DefaultConnection" Order="2" Enabled="False">
          <Destination Path="Data Source=|DataDirectory|aspnet-Prod.sdf" />
          <Object Type="DbSqlPackage">
            <PreSource Path="Data Source=|DataDirectory|aspnet-Dev.sdf" />
            <Source Path="$(IntermediateOutputPath)AutoScripts\DefaultConnection_IncrementalSchemaOnly.dacpac" Action="Publish" AllowIncompatiblePlatform="True" />
          </Object>
          <UpdateFrom Type="Web.Config">
            <Source MatchValue="Data Source=|DataDirectory|aspnet-Dev.sdf" MatchAttributes="$(UpdateFromConnectionStringAttributes)" />
          </UpdateFrom>
        </ObjectGroup>
      </Objects>
    </PublishDatabaseSettings>
  </PropertyGroup>
  <ItemGroup>
    <MSDeployParameterValue Include="$(DeployParameterPrefix)DefaultConnection-Web.config Connection String">
      <ParameterValue>Data Source=|DataDirectory|aspnet-Prod.sdf</ParameterValue>
    </MSDeployParameterValue>
    <MSDeployParameterValue Include="$(DeployParameterPrefix){Naam van de context-file}-Web.config Connection String">
      <ParameterValue>Data Source=|DataDirectory|{.sdf-file}.sdf</ParameterValue>
    </MSDeployParameterValue>
  </ItemGroup>
</Project>```

* Vul alle parameters tussen akkolade's in.
* Indien de app meerdere databases zou hebben, dient een nieuwe ObjectGroup-tag aangemaakt te worden en ingevuld worden zoals het gegeven voorbeeld.

## Locatie van de .sln-file

* Zip de map waarin het project staat. De extensie moet `.zip` zijn
* Zorg dat de .sln-file hetzelfde noemt als de projectmap.
* Zorg dat de .sln-file in de hoofdmap toegankelijk is.

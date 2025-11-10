# JD-TestApp

Test Application for JD Solutions

## IMPORTANT NOTE

This project is currently in active develoment, and not guaranteed for use at this time. 

## Summary

This app aims to provide a general-purpose environment for many possible implementations. It's plugin-based, and works much like a web browser in the sense that you can have multiple tabs open in multiple windows, and drag those tabs between windows. It provides a shell-like command structure which uses URIs to navigate between different screens - either system-level or plugin-level. 

It originated as just a test application for my TMDB API wrapper, but accidentally transformed into more of a general-purpose web browser sort of application. I've split it away from TMDB into its own thing, which I'm actively working to make it into a plugin-based application, where TMDB is just one of the many possible features. 

<img width="1317" height="860" alt="image" src="https://github.com/user-attachments/assets/42e3825d-53ea-42ac-a763-603096e0ffe4" />

## Plugins

A plugin is a specially designed DLL which can be loaded into the application to add functionality. It can be virtually anything, from features as simple as a clock, to as complicated as a business reporting module. In any case, a plugin registers a variety of menu items and shell extensions which in turn launch its various features.

## Shell Commands

This app aims to borrow the concept of Shell Commands from Windows to allow different plugins to execute commands and open a variety of screens by a universal path. For example, `jd://TMDB/Movies/11` to open the details of the movie Star Wars within the TMDB plugin. The same applies for other common protocols, especially `HTTP` and `HTTPS` in a typical web browser fashion. Extended protocols such as `FTP` and `RTSP` are also potential prospects for implementation. 

## Delphi Version

This project is written in Delphi 10.4. While it should work fine on other version of Delphi, there are no guarantees. The older the Delphi version, the less likely this library will be compatible.

## Third-Party Integration

### JDLib

The test applications uses controls from [JDLib, a separate repository of mine](https://github.com/djjd47130/JDLib).

### TChromeTabs

The test application uses the [`TChromeTabs` control](https://github.com/norgepaul/TChromeTabs).

### Indy

### X-SuperObject


import 'package:flutter/material.dart';

import 'models.dart';
import 'widgets.dart';

class HostIpGuide extends StatefulWidget {
  @override
  _HostIpGuideState createState() => _HostIpGuideState();
}

class _HostIpGuideState extends State<HostIpGuide> {
  OperatingSystem _os;

  _onOsChanged(os) {
    setState(() {
      _os = os;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text('Host IP Guide'),
            if (_os != null)
              Text('for ${osNames[_os]}', style: TextStyle(fontSize: 13)),
          ],
        ),
      ),
      body: buildBody(),
    );
  }

  // ignore: missing_return
  Widget buildBody() {
    var theme = Theme.of(context);
    if (_os == null) {
      return Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(24),
            child: Wrap(
              runSpacing: 16,
              children: [
                Text('Which operating system are you running VLC on?',
                    style: theme.textTheme.subtitle1),
                Column(
                    children: OperatingSystem.values
                        .map((os) => RadioListTile(
                              title: Text(osNames[os]),
                              value: os,
                              groupValue: _os,
                              onChanged: _onOsChanged,
                            ))
                        .toList())
              ],
            ),
          ),
        ],
      );
    }

    if (_os == OperatingSystem.linux) {
      return ListView(padding: EdgeInsets.all(24), children: [
        TextAndImages(children: <Widget>[
          Text(
              'Open a Terminal – on many popular distros this can be done by pressing Ctr + Alt + T.'),
          Text('In the Terminal window, type "ifconfig" and press Enter:'),
          Image.asset('assets/linux-terminal.png'),
          Text(
              'Your host IP will be one of the "inet" IP results which appears in the output of the command:'),
          Image.asset('assets/linux-ifconfig.png'),
          Text(
              'Depending on how your computer is set up, there may be multiple results:'),
          Text(
              'If you connect to the network via an ethernet cable, look for the inet IP under an "eth0" interface.'),
          Text(
              'If you connect to the network via Wi-Fi, look for the inet IP under a "wlan0" interface.'),
        ]),
      ]);
    }

    if (_os == OperatingSystem.macos) {
      return ListView(padding: EdgeInsets.all(24), children: [
        TextAndImages(children: <Widget>[
          Text('From the Apple menu, select "System Preferences".'),
          Text(
              'In the System Preferences window, click on the "Network" item:'),
          Image.asset('assets/mac-network.png'),
          Text(
              'Your IP address will be visible to the right of the Network window, as shown below:'),
          Image.asset('assets/mac-ip.png'),
        ]),
      ]);
    }

    if (_os == OperatingSystem.windows) {
      return ListView(padding: EdgeInsets.all(24), children: [
        TextAndImages(children: <Widget>[
          Text(
              'Open a Command Prompt by pressing Win + R, typing "cmd" in the dialog which appears, and presssing Enter:'),
          Image.asset('assets/windows-run.png'),
          Text(
              'In the Command Prompt window, type "ipconfig" and press Enter:'),
          Image.asset('assets/windows-cmd.png'),
          Text(
              'Your host IP will be one of the "IPv4 Address" results which appears in the output of the command:'),
          Image.asset('assets/windows-ipconfig.png'),
          Text(
              'Depending on how your computer is set up, there may be multiple results:'),
          Text(
              'If you connect to the network via an ethernet cable, look for the IPv4 Address under an "Ethernet adapter Ethernet" result.'),
          Text(
              'If you connect to the network via Wi-Fi, look for the IPv4 Address under an "Ethernet adapter Wireless Network Connection" result.'),
        ]),
      ]);
    }
  }
}

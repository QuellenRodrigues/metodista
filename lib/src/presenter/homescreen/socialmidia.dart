import 'package:flutter/material.dart';
import 'package:metodistaapp/src/constants/string.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMidia extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(onPressed: _launchURLInsta, icon: Image.asset('imagens/instagram.png'),),
          IconButton(onPressed: _launchURLFace, icon: Image.asset('imagens/facebook.png'),),
          IconButton(onPressed: _launchURLYou, icon: Image.asset('imagens/youtubesocial.png'),),
          IconButton(onPressed: _launchURLWhats, icon: Image.asset('imagens/whatsapp.png'),)

        ],
      ),
    );
  }
  _launchURLInsta() async {
      var url = Uri.parse(instagramurl);
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        throw 'Could not launch $url';
      }
  }
  _launchURLFace() async {
    var url = Uri.parse(facebook);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  _launchURLYou() async {
    var url = Uri.parse(youtube);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  _launchURLWhats() async {
    var url = Uri.parse(instagramurl);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

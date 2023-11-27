import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bx.dart';
import 'package:unsoedfess/features/cards/menfess_card.dart';

class ChannelPage extends StatefulWidget {
  const ChannelPage({super.key});

  @override
  State<ChannelPage> createState() => _ChannelPageState();
}

class _ChannelPageState extends State<ChannelPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
                    image: const DecorationImage(
                        image: NetworkImage(
                            'https://akcdn.detik.net.id/community/media/visual/2021/03/13/kampus-universitas-indonesia-dok-istimewa.jpeg?w=700&q=90'),
                        fit: BoxFit.cover)),
              ),
            ),
            Container(
              decoration: const BoxDecoration(color: Colors.white),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Teknik Jaya',
                        style: GoogleFonts.notoSans(fontWeight: FontWeight.w700)
                            .copyWith(fontSize: 24),
                      ),
                      const SizedBox(width: 8),
                      const badges.Badge(
                        badgeContent:
                            Icon(FluentIcons.checkmark_12_filled, size: 14, color: Colors.white),
                        badgeStyle: badges.BadgeStyle(
                            shape: badges.BadgeShape.instagram,
                            badgeColor: Colors.blue,
                            padding: EdgeInsets.all(6)),
                      ),
                    ],
                  ),

                  // const SizedBox(height: 10),
                  const Text(
                    'Tempat tanya, sharing dan cari jodoh jika beruntung 🤪',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  const IntrinsicHeight(
                    child: Row(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('1.523',
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                            SizedBox(width: 4),
                            Text('Followers',
                                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16)),
                          ],
                        ),
                        SizedBox(width: 16),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('245',
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                            SizedBox(width: 4),
                            Text('Members',
                                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16)),
                          ],
                        ),
                        SizedBox(width: 20),
                      ],
                    ),
                  ),

                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      children: [
                        ElevatedButton(
                            style: const ButtonStyle(
                                visualDensity: VisualDensity.compact,
                                backgroundColor: MaterialStatePropertyAll(Colors.black)),
                            onPressed: () {},
                            child: const Text(
                              'Follow',
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            )),
                        const SizedBox(width: 10),
                        const JoinMemberButton()
                      ],
                    ),
                  )
                ],
              ),
            ),
            const Divider(thickness: 0.5),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text('Feeds', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                ),
                MenfessCard(),
                MenfessCard(),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class JoinMemberButton extends StatefulWidget {
  const JoinMemberButton({
    super.key,
  });

  @override
  State<JoinMemberButton> createState() => _JoinMemberButtonState();
}

class _JoinMemberButtonState extends State<JoinMemberButton> {
  void _openModal() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(20))),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    Container(
                        width: 40,
                        height: 4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.grey.shade200,
                        )),
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: SizedBox(
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 100,
                                child: AspectRatio(
                                  aspectRatio: 1,
                                  child: Container(
                                    clipBehavior: Clip.hardEdge,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        image: const DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                'https://akcdn.detik.net.id/community/media/visual/2021/03/13/kampus-universitas-indonesia-dok-istimewa.jpeg?w=700&q=90'))),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Row(
                                children: [
                                  const Iconify(Bx.badge_check, size: 32),
                                  const SizedBox(width: 6),
                                  Text('Join as member of',
                                      style: GoogleFonts.poppins(fontWeight: FontWeight.w700)
                                          .copyWith(fontSize: 24)),
                                ],
                              ),
                              Text('Teknik Jaya',
                                  style: GoogleFonts.poppins(fontWeight: FontWeight.w700)
                                      .copyWith(fontSize: 30)),
                              const Divider(
                                height: 30,
                                thickness: 0.5,
                                color: Colors.grey,
                              ),
                              const Text(
                                'By becoming a member you will get access as below',
                                style: TextStyle(fontSize: 16),
                              )
                            ],
                          ),
                        )),
                  ],
                ),
              ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: ButtonStyle(
            visualDensity: VisualDensity.compact,
            padding: const MaterialStatePropertyAll(EdgeInsets.all(0)),
            side: MaterialStateProperty.all(const BorderSide(color: Colors.purple)),
            overlayColor: MaterialStateProperty.all(Colors.purple.shade100)),
        onPressed: _openModal,
        child: const Iconify(Bx.user_plus, color: Colors.purple));
  }
}

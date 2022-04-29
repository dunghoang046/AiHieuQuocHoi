
import 'package:app_aihieuquochoi/models/NguoiDungItem.dart';
import 'package:flutter/material.dart';

class NguoiDungCard extends StatelessWidget {
   List<NguoiDungItem>? LstNguoidung;
   NguoiDungCard({
    Key? key, this.LstNguoidung,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
  
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: LstNguoidung?.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(width: 1, color: Color(0xffC42323)))),
            child: ListTile(
               leading: Image.asset(index==0?"assets/images/medal_v.png":(index==1?"assets/images/medal_b.png":"assets/images/medal_d.png")),
              subtitle: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 10, bottom: 10),
                        child: Text(
                          'Người chơi:',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Expanded(
                        child: Container(
                            alignment: Alignment.topRight,
                            margin: const EdgeInsets.only(right: 0),
                            child:  Padding(
                              padding: const EdgeInsets.only(right: 0),
                              child: Text(LstNguoidung![index].tenhienthi!,
                                
                                style:const TextStyle(
                                    color: Color(0xffFFD42C),
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                      )
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 10, bottom: 10),
                        child: Text('Số điện thoại:',
                            style: TextStyle(color: Colors.white)),
                      ),
                      Expanded(
                        child: Container(
                            alignment: Alignment.topRight,
                            child: Padding(
                              padding:const EdgeInsets.only(),
                              child: Text(LstNguoidung![index].dienthoai!,
                                  style:const TextStyle(
                                      color: Color(0xffFFD42C),
                                      fontWeight: FontWeight.bold)),
                            )),
                      )
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 10, bottom: 10),
                        child: Text('Điểm cao nhất:',
                            style: TextStyle(color: Colors.white)),
                      ),
                      Expanded(
                        child: Container(
                            alignment: Alignment.topRight,
                            child:  Padding(
                              padding:const EdgeInsets.only(),
                              child: Text(LstNguoidung![index].diemCaoNhat!.toString(),
                                  style:const TextStyle(
                                      color: Color(0xffFFD42C),
                                      fontWeight: FontWeight.bold)),
                            )),
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}

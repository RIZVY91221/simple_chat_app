import 'package:app_base_flutter/core/theme/colors.dart';
import 'package:app_base_flutter/core/theme/text.dart';
import 'package:app_base_flutter/core/uttils/icons.dart';
import 'package:app_base_flutter/core/values/values.dart';
import 'package:app_base_flutter/core/widget/global/button/app_button.dart';
import 'package:app_base_flutter/core/widget/global/card/card.dart';
import 'package:app_base_flutter/core/widget/global/card/card_item.dart';
import 'package:app_base_flutter/core/widget/global/card/card_title.dart';
import 'package:app_base_flutter/core/widget/global/divider/wid_divider.dart';
import 'package:app_base_flutter/generated/assets.dart';
import 'package:flutter/material.dart';

Widget itemCard() => const CardWrapperWidget(
      cardHeader: CardHeader(), //Todo: using card header you can create new header....
      cardBody: CardBody(child: SizedBox.shrink()), //Todo: using card body you can pass multiple item....
      cardFooter: CardFooter(
        children: [
          //Todo: cans set bottom item inside footer widget...
        ],
      ),
    );

class CardTestDataModel {
  String? ordered;
  String? shipBy;
  String? orderNo;
  String? storeStatus;
  String? orderStatus;
  String? paymentStatus;
  String? fulfilmentStatus;
  int? itemCount;
  CardTestDataModel(
      {this.ordered,
      this.shipBy,
      this.orderNo,
      this.storeStatus,
      this.orderStatus,
      this.paymentStatus,
      this.fulfilmentStatus,
      this.itemCount});
}

class TestDataProvider extends InheritedWidget {
  final CardTestDataModel dataModel;
  final VoidCallback? onPressCard;
  const TestDataProvider({super.key, required this.dataModel, required super.child, this.onPressCard});
  @override
  bool updateShouldNotify(covariant TestDataProvider oldWidget) {
    return dataModel != oldWidget.dataModel;
  }

  static TestDataProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TestDataProvider>()!;
  }
}

class CardTestScreen extends StatefulWidget {
  const CardTestScreen({Key? key}) : super(key: key);
  @override
  State<CardTestScreen> createState() => _CardTestScreenState();
}

class _CardTestScreenState extends State<CardTestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Card",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).cardColor),
          ),
        ),
        body: ListView.separated(
            itemBuilder: (_, int i) {
              final data = itemsList[i];
              return TestDataProvider(
                  dataModel: data,
                  child: Builder(builder: (context) {
                    return CardWrapperWidget(
                      cardHeader: testCardHeader(context),
                      cardBody: testCardBody(context),
                      cardFooter: testCardFooter(context),
                    );
                  }));
            },
            separatorBuilder: (context, int i) => const AppDivider(),
            itemCount: itemsList.length));
  }

  List<CardTestDataModel> itemsList = [
    CardTestDataModel(
        ordered: '2 Feb 2024 13:55',
        shipBy: '3 Feb 2024 13:56',
        orderNo: '#M50071',
        storeStatus: 'Manual',
        orderStatus: 'Processed',
        paymentStatus: 'Paid',
        fulfilmentStatus: 'Ready for ship',
        itemCount: 30),
    CardTestDataModel(
        ordered: '3 Feb 2024 13:55',
        shipBy: '4 Feb 2024 13:56',
        orderNo: '#E50071',
        storeStatus: 'API',
        orderStatus: 'Processed',
        paymentStatus: 'Paid',
        fulfilmentStatus: 'Ready for ship',
        itemCount: 3),
    CardTestDataModel(
        ordered: '4 Feb 2024 13:55',
        shipBy: '4 Feb 2024 13:56',
        orderNo: '#E0071',
        storeStatus: 'API',
        orderStatus: 'Processed',
        paymentStatus: 'Paid',
        fulfilmentStatus: 'Ready for ship',
        itemCount: 3),
    CardTestDataModel(
        ordered: '4 Feb 2024 13:55',
        shipBy: '4 Feb 2024 13:56',
        orderNo: '#E0071',
        storeStatus: 'API',
        orderStatus: 'Processed',
        paymentStatus: 'Paid',
        fulfilmentStatus: 'Ready for ship',
        itemCount: 3),
  ];
  CardHeader testCardHeader(BuildContext context) {
    CardTestDataModel data = TestDataProvider.of(context).dataModel;
    return CardHeader(
      child: Column(
        children: [
          ItemCard(
            detailsKey: "Ordered: ",
            detailsValue: "${data.ordered}",
          ),
          ItemCard(
            detailsKey: "Ship By: ",
            detailsValue: "${data.shipBy}",
          ),
          AppGap.vertical6,
          CardTitleWithIcon(
            title: "${data.orderNo}",
            storeIcon: "",
          )
        ],
      ),
    );
  }

  CardBody testCardBody(BuildContext context) {
    CardTestDataModel data = TestDataProvider.of(context).dataModel;
    return CardBody(
      child: Column(
        children: [
          ItemCard(
            detailsKey: "Store Status: ",
            detailsValue: "${data.storeStatus} | ${data.orderStatus} | ${data.paymentStatus}",
          ),
          ItemCard(
            detailsKey: "Fulfilment Status: ",
            detailsValue: "${data.fulfilmentStatus}",
          ),
          ItemCard(
            detailsKey: "Item: ",
            detailsValue: "${data.itemCount}",
            isExpand: false,
            valueChild: Icon(
              Icons.keyboard_arrow_down_outlined,
              size: 20,
              color: AppColor.darkLightest6C7576,
            ),
          ),
        ],
      ),
    );
  }

  CardFooter testCardFooter(BuildContext context) {
    return CardFooter(
      alignment: MainAxisAlignment.end,
      children: [
        TextPrimaryButton(
          onPressed: () => TestDataProvider.of(context).onPressCard,
          padding: const EdgeInsets.only(top: AppPadding.p8),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppText.bodySmall("FBS", color: AppColor.primaryOne4B9EFF),
              AppGap.horizontal5,
              appSVG(Assets.svgNav),
            ],
          ),
        )
      ],
    );
  }
}

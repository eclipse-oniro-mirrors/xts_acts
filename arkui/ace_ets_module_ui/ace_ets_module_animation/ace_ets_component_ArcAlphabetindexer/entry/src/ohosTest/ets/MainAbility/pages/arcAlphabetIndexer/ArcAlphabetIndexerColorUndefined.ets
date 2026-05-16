// xxx.ets
import {
  LengthMetrics,
  ColorMetrics,
  ArcList,
  ArcListItem,
  ArcListAttribute,
  ArcListItemAttribute,
  ArcAlphabetIndexer,
  ArcAlphabetIndexerAttribute
} from '@kit.ArkUI'

@Entry
@Component
struct ArcAlphabetIndexerColorUndefined {
  private fullValue: string[] = [
    '#', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N',
    'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'
  ];
  private arrName : string[] = [
    '1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20',
    '21','22','23','24','25','26','27','28','29','30','31','32','33','34','35','36','37','38',
    '39','40', '41','42',
  ];

  private scrollerForList: Scroller = new Scroller();
  @State indexerIndex: number = 0;

  private watchSize: string = '466px'; // 手表默认宽高：233*233
  private itemSize: number = 24;  // 索引项默认大小：24

  build() {
    Column() {
      Row() {
        Stack() {
          ArcList({ scroller : this.scrollerForList, initialIndex: 0 }) {
            ForEach(this.arrName, (itemName: string, index: number) => {
              ArcListItem() {
                Text(itemName)
                  .width('90%')
                  .height('92px')
                  .fontSize(16)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(index % 2 == 0 ? 0xAFEEEE : 0x00FFFF)
                  .borderRadius(23)
              }
            })
          }
          .scrollBar(BarState.Off)
          .onScrollIndex((firstIndex: number, lastIndex: number, centerIndex: number) => {
            this.indexerIndex = centerIndex;
          })
          .borderWidth(1)
          .width(this.watchSize)
          .height(this.watchSize)
          .borderRadius(this.watchSize)
          .space(LengthMetrics.px(4))

          ArcAlphabetIndexer({ arrayValue: this.fullValue, selected: 0 })
            .autoCollapse(undefined)
            .width(this.watchSize)
            .height(this.watchSize)
            .usePopup(undefined)
            .popupFont(undefined)
            .selected(undefined)
            .popupBackgroundBlurStyle(undefined)
            .onSelect((index: number) => {
              this.indexerIndex = index;
              this.scrollerForList.scrollToIndex(this.indexerIndex);
            })
            .borderWidth(1)
            .hitTestBehavior(HitTestMode.Transparent)
            .selectedColor(undefined)
            .selectedBackgroundColor(undefined)
            .color(undefined)
            .popupColor(undefined)
            .popupBackground(undefined)
            .itemSize(undefined)
            .selectedFont(undefined)
            .font(undefined)

        }.width('100%').height('100%')
      }.width('100%').height('100%')
    }
  }
}
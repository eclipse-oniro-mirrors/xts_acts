'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { Entry,Component,$r,Builder,List,CopyOptions, AttributeModifier,RichEditor,RichEditorOptions,RichEditorAttribute,TextDataDetectorType,NavDestination,RichEditorController,Polyline,Progress,RowOptions,Navigation,Polygon,ProgressType,Path,NavPathStack,HorizontalAlign,Menu,MenuItemOptions,FontStyle,MenuItem,Font,Dimension,BorderRadiuses,ListItemGroup,LoadingProgress,Padding,Column,StickyStyle,ImageAnimator,ImageSpan,Alignment,Hyperlink,BreakpointsReference,GridRowDirection,TextOverflow,GridCol,ColumnOptions,Grid,GridItem,Gauge,FormComponent,Visibility,FormDimension,Divider,Counter,DataPanel,DatePicker,BorderImageOption,BorderOptions,AdaptiveColor,BackgroundEffectOptions,BorderStyle,RepeatMode,GradientDirection,Image,Checkbox,Blank,MarkStyle,ResourceColor,CheckboxGroup,Text,Toggle,ToggleType,FlexAlign,Color,Flex,ButtonType,FlexDirection,ItemAlign,Row,Button,ClickEvent,Week,GridRow,FontWeight,Axis,Margin,Swiper,ForEach,PickerTextStyle, CalendarAlign, CalendarPicker,EdgeEffect,Curve,SwiperDisplayMode,ArrowPosition, Select,BlurStyle,MenuAlignType,TextInputController,TextAlign,AlphabetIndexer} from '@ohos.arkui.component';
import {
  State,
  Link,
  PropRef,
  Observed
} from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { RichEditorModifier } from "@ohos.arkui.modifier";

// @Observed
// class CustomModifier implements AttributeModifier<RichEditorAttribute> {
//   copyOptions:CopyOptions = CopyOptions.InApp
//   applyNormalAttribute(instance: RichEditorAttribute): void {
//     instance.copyOptions(this.copyOptions)
//   }
//
//   onChangeRichEditor() {
//     this.copyOptions = CopyOptions.None
//   }
// }



 class CustomModifier extends RichEditorModifier {
  applyNormalAttribute(instance: RichEditorAttribute): void {
    // super.applyNormalAttribute?.(instance);
  }
  onChangeRichEditor() {
    this.copyOptions(CopyOptions.None)
  }
}


@Entry
@Component
struct RichEditorPage {
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller } as RichEditorOptions;
  @State phoneNumber: string = '(86) (755) ********';
  @State url: string = 'www.********.com';
  @State email: string = '***@example.com';
  @State address: string = 'XX省XX市XX区XXXX';
  @State enableDataDetector: boolean = true;
  @State types: TextDataDetectorType[] = new Array<TextDataDetectorType>();
  @State customModifier: CustomModifier = new CustomModifier()
    .copyOptions(CopyOptions.InApp)

  build() {
    Row(){
      Button("change value").onClick((e: ClickEvent) => {
        (this.customModifier as CustomModifier).onChangeRichEditor();
      }).key("changeButton")

    RichEditor(this.options)
      .onReady(() => {
        this.controller.addTextSpan('电话号码：' + this.phoneNumber + '\n',
          {
            style:
            {
              fontSize: 30
            }
          })
        this.controller.addTextSpan('链接：' + this.url + '\n',
          {
            style:
            {
              fontSize: 30
            }
          })
        this.controller.addTextSpan('邮箱：' + this.email + '\n',
          {
            style:
            {
              fontSize: 30
            }
          })
        this.controller.addTextSpan('地址：' + this.address,
          {
            style:
            {
              fontSize: 30
            }
          })
      })
      .attributeModifier(this.customModifier as CustomModifier)
      .key('richEditor')
      .enableDataDetector(this.enableDataDetector)
      .dataDetectorConfig({types : this.types, onDetectResultUpdate: (result: string)=>{}})
      .borderWidth(1)
      .padding(10)
      .width('100%')
      .height("100%")

    }

  }
}
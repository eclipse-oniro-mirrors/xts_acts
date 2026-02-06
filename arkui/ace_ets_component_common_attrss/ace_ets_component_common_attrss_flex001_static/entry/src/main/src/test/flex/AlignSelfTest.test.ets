'use static';
/*
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

import Utils, {
  BasePageConfig,
  PageConfig,
  TestValue,
  RectValue,
  DefaultAlignItems,
} from '../../../ets/MainAbility/common/Utils';
import CommonTest from '../common/CommonTest';
import { describe, expect, beforeAll } from '../../../../hypium/index'
import { ItemAlign, VerticalAlign, HorizontalAlign } from '@ohos.arkui.component'
import CommonFunc from '../../../ets/MainAbility/common/Common';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function alignSelfTest() {


  let supportView = [
    'AlphabetIndexer',
    'Button',
    'Checkbox',
    'CheckboxGroup',
    'DataPanel',
    'DatePicker',
    'Divider',
    'Gauge',
    'Image',
  // 'ImageAnimator',
  // 'LoadingProgress',
  // 'Marquee',
  // 'Menu',
  // 'Navigation',
  // 'NavRouter',
  // 'ScrollBar',
  // 'Row',
  // 'RelativeContainer',
  // 'TextTimer',
  // 'Progress',
  // 'QRCode',
  // 'Radio',
  // 'Rating',
  // 'Search',
  // 'Slider',
  // 'Text',
  // 'TextArea',
  // 'TextClock',
  // 'TextInput',
  // 'TextPicker',
  // 'TimePicker',
  // 'Toggle',
  // 'Badge',
  // 'Column',
  // 'Counter',
  // 'Grid',
  // 'List',
  // 'Refresh',
  // 'Scroll',
  // 'Stack',
  // 'Swiper',
  // 'Tabs',
  // 'Circle',
  // 'Ellipse',
  // 'Line',
  // 'Polyline',
  // 'Polygon',
  // 'Path',
  // 'Rect',
  // 'Shape'
  ]

  let containerView = ['Row', 'Column', 'FlexRow', 'FlexRowReverse', 'FlexColumn', 'FlexColumnReverse']

  let parentWidth = 400;
  let parentHeight = 400;

  let pageConfig: PageConfig = {
    testName: 'testAlignSelf',
    pageName: 'AlignSelfPage',
    pageUrl: 'MainAbility/pages/flex/AlignSelfPage',
    parentWidth: parentWidth,
    parentHeight: parentHeight,
    parentComponentKey: 'parentComponentKey'
  }

  let defaultAlignItems: DefaultAlignItems = {
    Row: VerticalAlign.Top,
    Column: HorizontalAlign.Start,
    Flex: ItemAlign.Start,
    GridRow: ItemAlign.Start
  }

  let testValues: TestValue[] = [{
    describe: 'SetAuto',
    setValue: {
      defaultAlignItems: defaultAlignItems,
      alignSelf: ItemAlign.Auto
    },
    expectValue: {
      expectAlignSelf: 'ItemAlign.Auto'
    }
  }, {
    describe: 'SetStart',
    setValue: {
      defaultAlignItems: {
        Row: VerticalAlign.Center,
        Column: HorizontalAlign.Center,
        Flex: ItemAlign.Center,
        GridRow: ItemAlign.Center
      },
      alignSelf: ItemAlign.Start
    },
    expectValue: {
      expectAlignSelf: 'ItemAlign.Start'
    }
  }, {
    describe: 'SetCenter',
    setValue: {
      defaultAlignItems: defaultAlignItems,
      alignSelf: ItemAlign.Center
    },
    expectValue: {
      expectAlignSelf: 'ItemAlign.Center'
    }
  }, {
    describe: 'SetEnd',
    setValue: {
      defaultAlignItems: defaultAlignItems,
      alignSelf: ItemAlign.End
    },
    expectValue: {
      expectAlignSelf: 'ItemAlign.End'
    }
  }, {
    describe: 'SetStretch',
    setValue: {
      defaultAlignItems: defaultAlignItems,
      alignSelf: ItemAlign.Stretch
    },
    expectValue: {
      expectAlignSelf: 'ItemAlign.Stretch'
    }
  }, {
    describe: 'SetBaseLine',
    setValue: {
      defaultAlignItems: defaultAlignItems,
      alignSelf: ItemAlign.Baseline
    },
    expectValue: {
      expectAlignSelf: 'ItemAlign.Baseline'
    }
  }]

  describe('AlignSelfTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("AlignSelfTest beforeEach start");
      await UtilsTest.startAbility("com.acts.arkui.component.common.attrs.001.test.static", "EntryAbility")
    });
    
    CommonTest.initTestByContainerView(pageConfig, containerView, supportView, testValues,
      async (data: BasePageConfig): Promise<void> => {
        console.info("AlignSelfTest start");
        //Get component rect and parent component rect
        let parentRect = Utils.getComponentRect(data.pageConfig.parentComponentKey as string);
        let rect = Utils.getComponentRect(((data.pageConfig.componentKey as string) as string) ?? '');

        //Get viewObj in order to judge attribute is set success
        let viewObj = Utils.getComponentByKey((data.pageConfig.componentKey as string) ?? '');
        AppStorage.setOrCreate<ItemAlign>('_alignSelf', data.testValue.setValue.alignSelf)
        //Verify attribute
        expect(viewObj.getElement('$attrs').getString('alignSelf')).assertEqual(data.testValue.expectValue.expectAlignSelf);
        const uiContext = AppStorage.get<UIContext>('uiContext')!;
        //When set different value, judge the alignment is correct
        if (data.pageConfig.containerView == 'Row' || data.pageConfig.containerView == 'FlexRow') {
          //When alignSelf : ItemAlign.Auto or ItemAlign.Start
          if (data.testValue.describe == 'SetAuto' || data.testValue.describe == 'SetStart') {
            expect(Math.floor(Math.abs(rect.top - parentRect.top)) <= 1).assertTrue();
            expect(Math.floor(Math.abs(rect.left - parentRect.left)) <= 1).assertTrue();
          } else if (data.testValue.describe == 'SetCenter') {
            //When alignSelf : ItemAlign.Center
            const rect = Utils.getComponentRect(data.pageConfig.componentKey)
            let rectY = Utils.getRectVerticalCenterY(rect);
            const parentRect = Utils.getComponentRect(data.pageConfig.parentComponentKey)
            let parentRectY = Utils.getRectVerticalCenterY(parentRect);
            console.info('[' + data.caseTag + '] rectY : ' + rectY);
            console.info('[' + data.caseTag + '] parentRectY : ' + parentRectY);
            expect(rectY).assertEqual(parentRectY);
            expect(Math.floor(Math.abs(rect.left - parentRect.left)) <= 1).assertTrue();
          } else if (data.testValue.describe == 'SetEnd') {
            //When alignSelf : ItemAlign.End
            expect(Math.floor(Math.abs(rect.bottom - parentRect.bottom)) <= 1).assertTrue();
            expect(Math.floor(Math.abs(rect.left - parentRect.left)) <= 1).assertTrue();
          } else if (data.testValue.describe == 'SetStretch') {
            //When alignSelf : ItemAlign.Stretch
            console.info('[' + data.caseTag + '] rect.bottom - rect.top: ' + (rect.bottom - rect.top));
            console.info('[' + data.caseTag + '] uiContext.vp2px(parentHeight): ' + uiContext.vp2px(parentHeight));
            if ((data.pageConfig.componentKey as string) == 'TextInput' || data.pageConfig.componentKey == 'TextArea') {
              expect(Math.floor(Math.abs((rect.bottom - rect.top) - uiContext.vp2px(parentHeight))) <= 2).assertTrue();
            } else {
              expect(Math.floor(Math.abs((rect.bottom - rect.top) - uiContext.vp2px(parentHeight))) <= 1).assertTrue();
            }
          }
        } else if (data.pageConfig.containerView == 'Column' || data.pageConfig.containerView == 'FlexColumn') {
          if (data.testValue.describe == 'SetAuto' || data.testValue.describe == 'SetStart') {
            //When alignSelf : ItemAlign.Auto or ItemAlign.Start
            expect(Math.floor(Math.abs(rect.top - parentRect.top)) <= 1).assertTrue();
            expect(Math.floor(Math.abs(rect.left - parentRect.left)) <= 1).assertTrue();
          } else if (data.testValue.describe == 'SetCenter') {
            //When alignSelf : ItemAlign.Center
            const rect = Utils.getComponentRect(data.pageConfig.componentKey)
            const parentRect = Utils.getComponentRect(data.pageConfig.parentComponentKey)
            let rectX = Utils.getRectHorizontalCenterX(rect);
            let parentRectX = Utils.getRectHorizontalCenterX(parentRect);
            console.info('[' + data.caseTag + '] rectX : ' + rectX);
            console.info('[' + data.caseTag + '] parentRectX : ' + parentRectX);
            expect(rectX).assertEqual(parentRectX);
            expect(Math.floor(Math.abs(rect.top - parentRect.top)) <= 1).assertTrue();
          } else if (data.testValue.describe == 'SetEnd') {
            //When alignSelf : ItemAlign.End
            expect(Math.floor(Math.abs(rect.top - parentRect.top)) <= 1).assertTrue();
            expect(Math.floor(Math.abs(rect.right - parentRect.right)) <= 1).assertTrue();
          } else if (data.testValue.describe == 'SetStretch') {
            //When alignSelf : ItemAlign.Stretch
            console.info('[' + data.caseTag + '] rect.right - rect.left: ' + (rect.right - rect.left));
            console.info('[' + data.caseTag + '] uiContext.vp2px(parentWidth): ' + uiContext.vp2px(parentWidth));
            if ((data.pageConfig.componentKey as string) == 'TextInput' || data.pageConfig.componentKey == 'TextArea') {
              expect(Math.floor(Math.abs((rect.right - rect.left) - uiContext.vp2px(parentWidth))) <= 2).assertTrue();
            } else {
              expect(Math.floor(Math.abs((rect.right - rect.left) - uiContext.vp2px(parentWidth))) <= 1).assertTrue();
            }
          }
        } else if (data.pageConfig.containerView == 'FlexRowReverse') {
          //Special parent component
          if (data.testValue.describe == 'SetAuto' || data.testValue.describe == 'SetStart') {
            //When alignSelf : ItemAlign.Auto or ItemAlign.Start
            expect(Math.floor(Math.abs(rect.top - parentRect.top)) <= 1).assertTrue();
            expect(Math.floor(Math.abs(rect.right - parentRect.right)) <= 1).assertTrue();
          } else if (data.testValue.describe == 'SetCenter') {
            //When alignSelf : ItemAlign.Center
            const rect = Utils.getComponentRect(data.pageConfig.componentKey)
            const parentRect = Utils.getComponentRect(data.pageConfig.parentComponentKey)
            let rectY = Utils.getRectVerticalCenterY(rect);
            let parentRectY = Utils.getRectVerticalCenterY(parentRect);
            console.info('[' + data.caseTag + '] rectY : ' + rectY);
            console.info('[' + data.caseTag + '] parentRectY : ' + parentRectY);
            expect(rectY).assertEqual(parentRectY);
            expect(Math.floor(Math.abs(rect.right - parentRect.right)) <= 1).assertTrue();
          } else if (data.testValue.describe == 'SetEnd') {
            //When alignSelf : ItemAlign.End
            expect(Math.floor(Math.abs(rect.bottom - parentRect.bottom)) <= 1).assertTrue();
            expect(Math.floor(Math.abs(rect.right - parentRect.right)) <= 1).assertTrue();
          } else if (data.testValue.describe == 'SetStretch') {
            //When alignSelf : ItemAlign.Stretch
            console.info('[' + data.caseTag + '] rect.bottom - rect.top: ' + (rect.bottom - rect.top));
            console.info('[' + data.caseTag + '] uiContext.vp2px(parentHeight): ' + uiContext.vp2px(parentHeight));
            if ((data.pageConfig.componentKey as string) == 'TextInput' || data.pageConfig.componentKey == 'TextArea') {
              expect(Math.floor(Math.abs((rect.bottom - rect.top) - uiContext.vp2px(parentHeight))) <= 2).assertTrue();
            } else {
              expect(Math.floor(Math.abs((rect.bottom - rect.top) - uiContext.vp2px(parentHeight))) <= 1).assertTrue();
            }
          }
        } else if (data.pageConfig.containerView == 'FlexColumnReverse') {
          //Special parent component
          if (data.testValue.describe == 'SetAuto' || data.testValue.describe == 'SetStart') {
            //When alignSelf : ItemAlign.Auto or ItemAlign.Start
            expect(Math.floor(Math.abs(rect.bottom - parentRect.bottom)) <= 1).assertTrue();
            expect(Math.floor(Math.abs(rect.left - parentRect.left)) <= 1).assertTrue();
          } else if (data.testValue.describe == 'SetCenter') {
            //When alignSelf : ItemAlign.Center
            const rect = Utils.getComponentRect(data.pageConfig.componentKey)
            const parentRect = Utils.getComponentRect(data.pageConfig.parentComponentKey)
            let rectX = Utils.getRectHorizontalCenterX(rect);
            let parentRectX = Utils.getRectHorizontalCenterX(parentRect);
            console.info('[' + data.caseTag + '] rectX : ' + rectX);
            console.info('[' + data.caseTag + '] parentRectX : ' + parentRectX);
            expect(rectX).assertEqual(parentRectX);
            expect(Math.floor(Math.abs(rect.bottom - parentRect.bottom)) <= 1).assertTrue();
          } else if (data.testValue.describe == 'SetEnd') {
            //When alignSelf : ItemAlign.End
            expect(Math.floor(Math.abs(rect.bottom - parentRect.bottom)) <= 1).assertTrue();
            expect(Math.floor(Math.abs(rect.right - parentRect.right)) <= 1).assertTrue();
          } else if (data.testValue.describe == 'SetStretch') {
            //When alignSelf : ItemAlign.Stretch
            console.info('[' + data.caseTag + '] rect.right - rect.left: ' + (rect.right - rect.left));
            console.info('[' + data.caseTag + '] uiContext.vp2px(parentWidth): ' + uiContext.vp2px(parentWidth));
            if ((data.pageConfig.componentKey as string) == 'TextInput' || data.pageConfig.componentKey == 'TextArea') {
              expect(Math.floor(Math.abs((rect.right - rect.left) - uiContext.vp2px(parentWidth))) <= 2).assertTrue();
            } else {
              expect(Math.floor(Math.abs((rect.right - rect.left) - uiContext.vp2px(parentWidth))) <= 1).assertTrue();
            }
          }
        }
      })
  })
}
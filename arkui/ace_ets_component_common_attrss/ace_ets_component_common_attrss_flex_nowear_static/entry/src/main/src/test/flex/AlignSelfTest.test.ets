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

import { AlignRuleOption, HorizontalAlign, ItemAlign, VerticalAlign } from '@ohos.arkui.component';
import { AlignItems, AttrsManager } from '../../../ets/MainAbility/common/AttrsManager';
import Utils, { BasePageConfig, PageConfig, RectValue, TestValue } from '../../../ets/MainAbility/common/Utils';
import CommonTest, { CallbackWithReturn } from '../common/CommonTest';
import { beforeAll, describe, expect } from '../../../../hypium/index';
import { jsonx } from 'std/core';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { UIContext } from '@ohos.arkui.UIContext';

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

class SetValue {
  defaultAlignItems: AlignItems = new AlignItems();
  alignSelf: ItemAlign = ItemAlign.Auto;
}

export default function alignSelfTest() {


  let supportView: Array<string> = new Array<string>(
    'SideBarContainer',
    'WaterFlow',
    'Select',
    'RowSplit',
    'ColumnSplit'
  )

  let containerView: Array<string> =
    new Array<string>(
      'Row',
      'Column',
      'FlexRow',
      'FlexRowReverse',
      'FlexColumn',
      'FlexColumnReverse'
    )

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

  let defaultAlignItems: AlignItems = {
    Row: VerticalAlign.Top,
    Column: HorizontalAlign.Start,
    Flex: ItemAlign.Start,
    GridRow: ItemAlign.Start
  }

  let testValues: TestValue[] = [
    {
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
  },
    {
      describe: 'SetCenter',
      setValue: {
        defaultAlignItems: defaultAlignItems,
        alignSelf: ItemAlign.Center
      },
      expectValue: {
        expectAlignSelf: 'ItemAlign.Center'
      }
    },
    {
      describe: 'SetEnd',
      setValue: {
        defaultAlignItems: defaultAlignItems,
        alignSelf: ItemAlign.End
      },
      expectValue: {
        expectAlignSelf: 'ItemAlign.End'
      }
    },
    {
      describe: 'SetStretch',
      setValue: {
        defaultAlignItems: defaultAlignItems,
        alignSelf: ItemAlign.Stretch
      },
      expectValue: {
        expectAlignSelf: 'ItemAlign.Stretch'
      }
    },
    {
      describe: 'SetBaseLine',
      setValue: {
        defaultAlignItems: defaultAlignItems,
        alignSelf: ItemAlign.Baseline
      },
      expectValue: {
        expectAlignSelf: 'ItemAlign.Baseline'
      }
    }
  ]

  describe('AlignSelfTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("alignSelfTest beforeAll start");
      await UtilsTest.startAbility("com.acts.arkui.component.common.attrs.flex.nowear.test.static", "EntryAbility")
    });

    CommonTest.initTestByContainerView(pageConfig, containerView, supportView, testValues,
      async (data: BasePageConfig): Promise<void> => {
        const uiContext: UIContext = AppStorage.get<UIContext>('uiContent')!;
        console.info('alignSelfPage', data.testValue.setValue)
        AppStorage.setOrCreate<ItemAlign>('_alignSelf', data.testValue.setValue.alignSelf)
        AppStorage.setOrCreate<ItemAlign>('_alignItemsForFlex', data.testValue.setValue.defaultAlignItems.Flex)
        AppStorage.setOrCreate<VerticalAlign>('_alignItemsForRow', data.testValue.setValue.defaultAlignItems.Row)
        AppStorage.setOrCreate<HorizontalAlign>('_alignItemsForColumn',
          data.testValue.setValue.defaultAlignItems.Column)
        AppStorage.setOrCreate<ItemAlign>('_alignItemsForGridRow', data.testValue.setValue.defaultAlignItems.GridRow)
        await Utils.sleep(1000);

        //Get component rect and parent component rect
        let parentRect = Utils.getComponentRect(data.pageConfig.parentComponentKey as string);
        let rect = Utils.getComponentRect(data.pageConfig.componentKey as string);

        //Get viewObj in order to judge attribute is set success
        // let viewObj: jsonx.JsonElement = Utils.getComponentByKey(data.pageConfig.componentKey as string);
        console.log('test rect ' + JSON.stringify(rect) + ' test parentRect ' + JSON.stringify(parentRect))

        console.log(pageConfig.componentKey + '  test011')
        console.log(pageConfig.parentComponentKey + '  test012')
        let strJson = inspector.getInspectorByKey(pageConfig.componentKey as String);
        await Utils.sleep(2000)
        console.log(JSON.stringify(strJson) + 'test789')
        data.viewObj = JSON.parseJsonElement(strJson);

        //Verify attribute
        expect(data.viewObj!.getElement('$attrs').getString('alignSelf'))
          .assertEqual(data.testValue.expectValue.expectAlignSelf);

        //When set different value, judge the alignment is correct
        if (data.pageConfig.containerView == 'Row' || data.pageConfig.containerView == 'FlexRow') {
          //When alignSelf : ItemAlign.Auto or ItemAlign.Start
          if (data.testValue.describe == 'SetAuto' || data.testValue.describe == 'SetStart') {
            expect(rect.top).assertEqual(parentRect.top);
            expect(rect.left).assertEqual(parentRect.left);
          } else if (data.testValue.describe == 'SetCenter') {
            //When alignSelf : ItemAlign.Center
            let rectY = Utils.getRectVerticalCenterY(rect);
            let parentRectY = Utils.getRectVerticalCenterY(parentRect);
            console.info('[' + data.caseTag + '] rectY : ' + rectY);
            console.info('[' + data.caseTag + '] parentRectY : ' + parentRectY);
            expect(rectY).assertEqual(parentRectY);
            expect(rect.left).assertEqual(parentRect.left);
          } else if (data.testValue.describe == 'SetEnd') {
            //When alignSelf : ItemAlign.End
            expect(rect.bottom).assertEqual(parentRect.bottom);
            expect(rect.left).assertEqual(parentRect.left);
          } else if (data.testValue.describe == 'SetStretch') {
            //When alignSelf : ItemAlign.Stretch
            expect(Math.abs((rect.bottom - rect.top) - uiContext.vp2px(parentHeight)) <= 1).assertTrue();
          }
        } else if (data.pageConfig.containerView == 'Column' || data.pageConfig.containerView == 'FlexColumn') {
          if (data.testValue.describe == 'SetAuto' || data.testValue.describe == 'SetStart') {
            //When alignSelf : ItemAlign.Auto or ItemAlign.Start
            expect(rect.top).assertEqual(parentRect.top);
            expect(rect.left).assertEqual(parentRect.left);
          } else if (data.testValue.describe == 'SetCenter') {
            //When alignSelf : ItemAlign.Center
            let rectX = Utils.getRectHorizontalCenterX(rect);
            let parentRectX = Utils.getRectHorizontalCenterX(parentRect);
            console.info('[' + data.caseTag + '] rectX : ' + rectX);
            console.info('[' + data.caseTag + '] parentRectX : ' + parentRectX);
            expect(rectX).assertEqual(parentRectX);
            expect(rect.top).assertEqual(parentRect.top);
          } else if (data.testValue.describe == 'SetEnd') {
            //When alignSelf : ItemAlign.End
            expect(rect.top).assertEqual(parentRect.top);
            expect(rect.right).assertEqual(parentRect.right);
          } else if (data.testValue.describe == 'SetStretch') {
            //When alignSelf : ItemAlign.Stretch
            expect(Math.abs((rect.right - rect.left) - uiContext.vp2px(parentWidth)) <= 1).assertTrue();
          }
        } else if (data.pageConfig.containerView == 'FlexRowReverse') {
          //Special parent component
          if (data.testValue.describe == 'SetAuto' || data.testValue.describe == 'SetStart') {
            //When alignSelf : ItemAlign.Auto or ItemAlign.Start
            expect(rect.top).assertEqual(parentRect.top);
            expect(rect.right).assertEqual(parentRect.right);
          } else if (data.testValue.describe == 'SetCenter') {
            //When alignSelf : ItemAlign.Center
            let rectY = Utils.getRectVerticalCenterY(rect);
            let parentRectY = Utils.getRectVerticalCenterY(parentRect);
            console.info('[' + data.caseTag + '] rectY : ' + rectY);
            console.info('[' + data.caseTag + '] parentRectY : ' + parentRectY);
            expect(rectY).assertEqual(parentRectY);
            expect(rect.right).assertEqual(parentRect.right);
          } else if (data.testValue.describe == 'SetEnd') {
            //When alignSelf : ItemAlign.End
            expect(rect.bottom).assertEqual(parentRect.bottom);
            expect(rect.right).assertEqual(parentRect.right);
          } else if (data.testValue.describe == 'SetStretch') {
            //When alignSelf : ItemAlign.Stretch
            expect(Math.abs((rect.bottom - rect.top) - uiContext.vp2px(parentHeight)) <= 1).assertTrue();
          }
        } else if (data.pageConfig.containerView == 'FlexColumnReverse') {
          //Special parent component
          if (data.testValue.describe == 'SetAuto' || data.testValue.describe == 'SetStart') {
            //When alignSelf : ItemAlign.Auto or ItemAlign.Start
            expect(rect.bottom).assertEqual(parentRect.bottom);
            expect(rect.left).assertEqual(parentRect.left);
          } else if (data.testValue.describe == 'SetCenter') {
            //When alignSelf : ItemAlign.Center
            let rectX = Utils.getRectHorizontalCenterX(rect);
            let parentRectX = Utils.getRectHorizontalCenterX(parentRect);
            console.info('[' + data.caseTag + '] rectX : ' + rectX);
            console.info('[' + data.caseTag + '] parentRectX : ' + parentRectX);
            expect(rectX).assertEqual(parentRectX);
            expect(rect.bottom).assertEqual(parentRect.bottom);
          } else if (data.testValue.describe == 'SetEnd') {
            //When alignSelf : ItemAlign.End
            expect(rect.bottom).assertEqual(parentRect.bottom);
            expect(rect.right).assertEqual(parentRect.right);
          } else if (data.testValue.describe == 'SetStretch') {
            //When alignSelf : ItemAlign.Stretch
            expect(Math.abs((rect.right - rect.left) - uiContext.vp2px(parentWidth)) <= 1).assertTrue();
          }
        }
      })
  })
}
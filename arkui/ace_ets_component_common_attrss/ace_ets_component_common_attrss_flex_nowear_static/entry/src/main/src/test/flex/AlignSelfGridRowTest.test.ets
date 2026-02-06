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
import Utils, {
  BasePageConfig,
  DefaultAlign,
  PageConfig,
  RectValue,
  TestValue
} from '../../../ets/MainAbility/common/Utils';
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
import { Router, UIContext } from '@ohos.arkui.UIContext';

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function alignSelfGridRowTest() {

  
  await UtilsTest.startAbility("com.acts.arkui.component.common.attrs.flex.nowear.test.static", "EntryAbility")
  

  const uiContext: UIContext = AppStorage.get<UIContext>('uiContext')!

  let supportView: Array<string> = new Array<string>(
    'GridCol'
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
    },
    {
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

  describe('AlignSelfGridRowTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("alignSelfGridRowTest beforeAll start");

    });

    CommonTest.initTest(pageConfig, supportView, testValues, async (data: BasePageConfig): Promise<void> => {

      //Get component rect and parent component rect
      let parentRect = Utils.getComponentRect(data.pageConfig.parentComponentKey as string);
      let rect = Utils.getComponentRect(data.pageConfig.componentKey as string);
      console.log('parentComponentKey is ' + data.pageConfig.parentComponentKey + 'componentKey is ' +
      data.pageConfig.componentKey)
      let uiContext: UIContext = AppStorage.get<UIContext>('uiContext')!

      console.info('alignSelfPage', data.testValue.setValue)
      AppStorage.setOrCreate<ItemAlign>('_alignSelf', data.testValue.setValue.alignSelf)
      AppStorage.setOrCreate<ItemAlign>('_alignItemsForFlex', data.testValue.setValue.defaultAlignItems.Flex)
      AppStorage.setOrCreate<VerticalAlign>('_alignItemsForRow', data.testValue.setValue.defaultAlignItems.Row)
      AppStorage.setOrCreate<HorizontalAlign>('_alignItemsForColumn', data.testValue.setValue.defaultAlignItems.Column)
      AppStorage.setOrCreate<ItemAlign>('_alignItemsForGridRow', data.testValue.setValue.defaultAlignItems.GridRow)
      await Utils.sleep(1000);

      //Get viewObj in order to judge attribute is set success
      // let viewObj: jsonx.JsonElement = Utils.getComponentByKey(data.pageConfig.componentKey as string);

      console.log(pageConfig.componentKey + '  test011')
      let strJson = inspector.getInspectorByKey(pageConfig.componentKey as String);
      await Utils.sleep(2000)
      console.log(JSON.stringify(strJson) + 'test789')
      data.viewObj = JSON.parseJsonElement(strJson);

      //Verify attribute
      expect(data.viewObj!.getElement('$attrs').getString('alignSelf'))
        .assertEqual(data.testValue.expectValue.expectAlignSelf);

      //When set different value, judge the alignment is correct
      if (data.testValue.describe == 'SetAuto' || data.testValue.describe == 'SetStart') {
        //When alignSelf : ItemAlign.Auto or ItemAlign.Start
        expect(rect.top).assertEqual(parentRect.top);
        expect(rect.left).assertEqual(parentRect.left as Double);
      } else if (data.testValue.describe == 'SetCenter') {
        //When alignSelf : ItemAlign.Center
        let rectY = Utils.getRectVerticalCenterY(rect);
        console.info('[' + data.caseTag + '] rectY : '
          + rectY);

        let parentRectY = Utils.getRectVerticalCenterY(parentRect);
        console.info('[' + data.caseTag + '] parentRectY : '
          + parentRectY);

        expect(rectY).assertEqual(parentRectY);
      } else if (data.testValue.describe == 'SetEnd') {
        //When alignSelf : ItemAlign.End
        expect(rect.bottom).assertEqual(parentRect.bottom);
        expect(rect.left).assertEqual(parentRect.left);
      } else if (data.testValue.describe == 'SetStretch') {
        //When alignSelf : ItemAlign.Stretch
        expect(rect.bottom - rect.top).assertEqual(uiContext!.vp2px(parentHeight));
      }
    })
  })
}
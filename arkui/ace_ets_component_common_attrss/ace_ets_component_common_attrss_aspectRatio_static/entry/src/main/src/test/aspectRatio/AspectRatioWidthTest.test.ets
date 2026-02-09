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

import { AttrsManager } from '../../../ets/MainAbility/common/AttrsManager';
import {Color,$r} from '@ohos.arkui.component'
import Utils, {CurrentRatio, BasePageConfig, PageConfig, TestValue, RectValue,SetValue,StrJsonObj } from '../../../ets/MainAbility/common/Utils';
import CommonTest, { CallbackWithReturn } from '../common/CommonTest';
import { describe, expect,beforeAll } from '../../../../hypium/index';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UtilsTest } from '../Util.test';
let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
interface Attrs{
  $attrs: SetValue
}

export default function aspectRatioWidthTest() {
  // let uiContext = AppStorage.get<UIContext>("uiContext")
  //Component to be tested
  let supportView: Array<string> = new Array<string>(
    'AlphabetIndexer',
    'Blank',
    'Button',
    'Checkbox',
    'CheckboxGroup',
    'DataPanel',
    'DatePicker',
    'Divider',
    'Gauge',
    'Image',
    'ImageAnimator',
    'LoadingProgress',
    'Marquee',
    'Menu',
    'MenuItem',
    'Navigation',
    'Progress',
    'QRCode',
    'Radio',
    'Rating',
    'ScrollBar',
    'Search',
    'Slider',
    'Text',
    'TextArea',
    'TextClock',
    'TextInput',
    'TextPicker',
    'TextTimer',
    'TimePicker',
    'Toggle',
    'Badge',
    'Column',
    'Counter',
    'Flex',
    'GridRow',
    'Grid',
    'GridItem',
    'List',
    // 'ListItem',
    'Refresh',
    'RelativeContainer',
    'Row',
    'Scroll',
    'Stack',
    'Swiper',
    'Tabs',
    'Circle',
    'Ellipse',
    'Line',
    'Polyline',
    'Polygon',
    'Path',
    'Rect',
    'Shape'
  )

  //Custom params.
  let parentWidth = 300;
  let parentHeight = 600;

  let pageConfig: PageConfig = {
    testName: 'testAspectRatioWidth',
    pageName: 'AspectRatioWidthPage',
    pageUrl: 'MainAbility/pages/aspectRatio/AspectRatioWidthPage',
    targetGroupView: 'targetGroupView',
    parentWidth: parentWidth,
    parentHeight: parentHeight
  }
  //Test content and expected results
  let testValues: TestValue[] = [
    {
    describe: 'SetNumber',
    setValue: {
      width: 100,
      aspectRatio: 2.0
    },
    expectValue: {
      width: '100.00vp',
      widthValue: 100,
      aspectRatio: 2.0
    }
  },
    {
    describe: 'SetDecimal',
    setValue: {
      width: 100,
      aspectRatio: 0.5
    },
    expectValue: {
      width: '100.00vp',
      widthValue: 100,
      aspectRatio: 0.5
    }
  }
  ]
  describe('AspectRatioWidthTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility("com.acts.arkui.component.common.attrs.test.static", "EntryAbility")
    });

    CommonTest.initTest(pageConfig, supportView, testValues, async (data: BasePageConfig): Promise<void> => {
      //Gets Rect information for the target component
      AppStorage.setOrCreate<number>('_aspectRatio',  data.testValue.setValue.aspectRatio)
      AppStorage.setOrCreate<number>('_width',  data.testValue.setValue.width as number)
      let targetRect = Utils.getComponentRect(data.pageConfig.componentKey??'');
      let targetRectWidth = targetRect.right - targetRect.left;
      let targetRectHeight = targetRect.bottom - targetRect.top;
      let targetRectAspectRatio = targetRectWidth / targetRectHeight;
      //Check width and aspectRatio are set successfully
      let attrs = data.viewObj
      data.testValue.expectValue.widthValue = UIContext.resolveUIContext()!.vp2px(100)

      console.info('[' + data.caseTag + '] data.viewObj.$attrs.width is:' + attrs?.getElement('$attrs').getString('width'));
      console.info('[' + data.caseTag + '] data.viewObj.$attrs.aspectRatio is:' + attrs?.getElement('$attrs').getDouble('aspectRatio'));
      expect(attrs?.getElement('$attrs').getString('width')).assertEqual(data.testValue.expectValue.width);
      expect(attrs?.getElement('$attrs').getDouble('aspectRatio')).assertEqual(data.testValue.expectValue.aspectRatio);

      //Check the width, height, and aspectRatio are correct
      console.info('[' + data.caseTag + '] targetRectWidth is:' + targetRectWidth);
      console.info('[' + data.caseTag + '] targetRectHeight is:' + targetRectHeight);
      console.info('[' + data.caseTag + '] targetRectAspectRatio:' + targetRectAspectRatio);
      console.info('[' + data.caseTag + '] data.testValue.expectValue.widthValue:' + data.testValue.expectValue.widthValue);
      console.info('[' + data.caseTag + '] data.testValue.expectValue.aspectRatio:' + data.testValue.expectValue.aspectRatio);
      console.info('[' + data.caseTag + '] data.testValue.expectValue.widthValue / data.testValue.expectValue.aspectRatio:' + (data.testValue.expectValue.widthValue as number) / data.testValue.expectValue.aspectRatio);
      expect(Math.floor(Math.abs(targetRectWidth - (data.testValue.expectValue.widthValue as number))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(targetRectAspectRatio - data.testValue.expectValue.aspectRatio)) <= 1).assertTrue();
      if (data.pageConfig.componentKey == 'TextInput') {
        expect(Math.floor(Math.abs(targetRectHeight - (data.testValue.expectValue.widthValue as number) / data.testValue.expectValue.aspectRatio)) <= 2).assertTrue();
      } else {
        expect(Math.floor(Math.abs(targetRectHeight - (data.testValue.expectValue.widthValue as number) / data.testValue.expectValue.aspectRatio)) <= 1).assertTrue();
      }
    });
  })
}

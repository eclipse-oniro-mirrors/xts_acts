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
import Utils, { BasePageConfig, PageConfig, TestValue, RectValue, SetValue, ResponseRegion } from '../../../ets/MainAbility/common/Utils';
import CommonTest, { CallbackWithReturn } from '../common/CommonTest';
import CommonTest from "../common/CommonTest"
import { describe, expect, beforeAll } from '../../../../hypium/index';
import { UIContext } from "@ohos.arkui.UIContext";
import { $r,Rectangle } from '@ohos.arkui.component'
import { AttrsManager } from '../../../ets/MainAbility/common/AttrsManager';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UtilsTest, startAbility, stopApplication } from '../Util.test';
import {
   Rectangle
} from '@ohos.arkui.component'
let domain: int= 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
const uiContext = new UIContext();

async function clickPoint(data: BasePageConfig, xPoint: number, yPoint: number) {
  await Utils.performClickPoint(xPoint, yPoint);
  await Utils.sleep(1000);
  if ('Select' == data.pageConfig.componentKey) {
    await Utils.sleep(2000);
    await eventResult(data, 'onClick');
    Utils.performClick(data.pageConfig.componentKey);
    await Utils.sleep(2000);
    await resetStatus(data);
  } else {
    await eventResult(data, 'onClick');
    await resetStatus(data);
  }
}

async function resetStatus(data: BasePageConfig) {
  console.info('[' + data.caseTag + '] reset status.');
  AppStorage.setOrCreate<Array<Rectangle>>('_responseRegion', data.testValue.setValue as Array<Rectangle>)
  AppStorage.setOrCreate<string>('eventCallBackStr', 'notOnClick')
  AppStorage.setOrCreate<string>('eventCallBackStr', '')
  await Utils.sleep(1000);
}

async function eventResult(data: BasePageConfig, expectationValue: string) {
  if (
    data.pageConfig.targetView == "TextInput" ||
      data.pageConfig.targetView == "TextArea"
  ) {
    await Utils.sleep(4000)
  } else {
    await Utils.sleep(1000)
  }
  let referenceComponent = Utils.getComponentByKey(data.pageConfig.referenceComponentKey);
  await Utils.sleep(1000);
  console.info('[' + data.caseTag + ']' + 'content is:' + referenceComponent.getElement('$attrs').getString('content'));
  if ('' == expectationValue) {
    expect(referenceComponent.getElement('$attrs').getString('content')).assertEqual(expectationValue);
  } else {
    expect(referenceComponent.getElement('$attrs').getString('content')).assertContain(expectationValue);
  }
}



export default function responseRegionTest() {
  let supportView:Array<string> = new Array<string>(
    'Text',
    'TextArea',  // 55000ms pass
    'TextClock', //TextClock_static_SetNumber
    'TextInput', // 55000ms pass
    'TextTimer', //TextTimer_static_SetNumber
    'Toggle',
    'Badge',
    'Column',
    'Counter',
    'Flex',
    'GridCol',
    'GridRow',
    'Grid',
    'List'
  )
  //Custom params.
  let targetWidth = 200;
  let targetHeight = 200;
  let click = 'onClick';
  let notClick = '';
  let pageConfig: PageConfig = {
    testName: 'testResponseRegion',
    pageName: 'ResponseRegionPage',
    pageUrl: 'MainAbility/pages/responseRegion/ResponseRegionPage',
    targetHeight: targetHeight,
    targetWidth: targetWidth,
    referenceComponentKey: 'referenceComponentKey',
    referenceText: 'referenceText'
  }

  let testValues: TestValue[] = [
    {
    describe: 'SetNumber',
    setValue: [{
      x: 50, y: 50, width: 200, height: 200
    }],
    expectValue: {
      responseRegion: [{
        x: '50.00vp', y: '50.00vp', width: '200.00vp', height: '200.00vp'
      }]
    }}
     ,{
       describe: 'SetStringPx',
       setValue: [{
         x: '100px',
         y: '100px',
         width: '200px',
         height: '200px',
         // numberPxX: 100,
         // numberPxY: 100,
         // numberPxWidth: 200,
         // numberPxHeight: 200
       }],
       expectValue: {
         responseRegion: [{
           x: '100.00px', y: '100.00px', width: '200.00px', height: '200.00px'
         } ]
       }
     }, {
       describe: 'SetPercent',
       setValue: [{
         x: '20%',
         y: '20%',
         width: '100%',
         height: '100%',
         // ratioX: 0.2,
         // ratioY: 0.2,
         // ratioWidth: 1.0,
         // ratioHeight: 1.0
       }],
       expectValue: {
         responseRegion: [{
           x: '20.00%', y: '20.00%', width: '100.00%', height: '100.00%'
         }]
       }
     }, {
       describe: 'SetResource',
       setValue: [{
         x: $r('app.float.50vp'),
         y: $r('app.float.50vp'),
         width: $r('app.float.200vp'),
         height: $r('app.float.200vp'),
         // numberX: 50,
         // numberY: 50,
         // numberWidth: 200,
         // numberHeight: 200
       }],
       expectValue: {
         responseRegion: [{
           x: '50.00vp', y: '50.00vp', width: '200.00vp', height: '200.00vp'
         }]
       }
     }, {
       describe: 'SetOutsideArea',
       setValue: [{
         x: -200,
         y: 0,
         width: '100%',
         height: '100%',
         // ratioWidth: 1.0,
         // ratioHeight: 1.0
       }],
       expectValue: {
         responseRegion: [{
           x: '-200.00vp', y: '0.00vp', width: '100.00%', height: '100.00%'
         }]
       }
     }, {
       describe: 'SetIntraArea',
       setValue: [{
         x: 0,
         y: 0,
         width: '100%',
         height: '100%',
         // ratioWidth: 1.0,
         // ratioHeight: 1.0
       }],
       expectValue: {
         responseRegion: [{
           x: '0.00vp', y: '0.00vp', width: '100.00%', height: '100.00%'
         }]
       }
     }, {
       describe: 'SetMultiArea',
       exceptView: ['Search'],
       setValue: [{
         x: 0,
         y: 0,
         width: '100%',
         height: '100%',
         // ratioWidth: 1.0,
         // ratioHeight: 1.0
       }, {
         x: -200,
         y: -200,
         width: '100%',
         height: '100%',
         // ratioWidth: 1.0,
         // ratioHeight: 1.0
       }],
       expectValue: {
         responseRegion: [{
           x: '0.00vp', y: '0.00vp', width: '100.00%', height: '100.00%'
         }, {
           x: '-200.00vp', y: '-200.00vp', width: '100.00%', height: '100.00%'
         }]
       }
     }
    ]

  describe('ResponseRegionTest', () => {
    beforeAll(() => {
      console.info("ResponseRegionTest beforeEach start");
      await UtilsTest.startAbility("com.acts.arkui.component.common.attrs02.test.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    CommonTest.initTest(pageConfig, supportView, testValues, async (data: BasePageConfig): Promise<void> => {
      //Get the initial region information of the target component
      console.info('[' + data.caseTag + '] get Component rect before position changed.');
      let rect: RectValue = Utils.getComponentRect(data.pageConfig.componentKey);
      let rectHeight = rect.bottom - rect.top;
      let rectWidth = rect.right - rect.left;
      let uiContext = AppStorage.get<UIContext>('uiContext')
      console.info('[' + data.caseTag + '] setValue : ' + JSON.stringify(data.testValue.setValue));
      // AttrsManager.change(data.caseTag, data.testValue.setValue);
      AppStorage.setOrCreate<Array<Rectangle>>('_responseRegion', data.testValue.setValue as Array<Rectangle>)
      AppStorage.setOrCreate<string>('eventCallBackStr', 'notOnClick')
      AppStorage.setOrCreate<string>('eventCallBackStr', '')
      await Utils.sleep(1000);
      let viewObj = Utils.getComponentByKey(data.pageConfig.componentKey);
      console.info('[wll]'+viewObj)
      if ('SetMultiArea' == data.testValue.describe) {
        expect(JSON.stringifyJsonElement(viewObj.getElement('$attrs').getElement('responseRegion')[0]).replaceAll('\\', ''))
          .assertEqual(`"${JSON.stringify(data.testValue.expectValue?.responseRegion[0])}"`);
        expect(JSON.stringifyJsonElement(viewObj.getElement('$attrs').getElement('responseRegion')[1]).replaceAll('\\', ''))
          .assertEqual(`"${JSON.stringify(data.testValue.expectValue?.responseRegion[1])}"`);
      } else {
        expect(JSON.stringifyJsonElement(viewObj.getElement('$attrs').getElement('responseRegion')[0]).replaceAll('\\', ''))
          .assertEqual(`"${JSON.stringify(data.testValue.expectValue?.responseRegion[0])}"`);
      }
      let offsetX:number | undefined = 0;
      let offsetY:number | undefined = 0;
      let offsetHeight:number | undefined = 0;
      let offsetWidth:number | undefined= 0;
      let firstOffsetX:number | undefined = 0;
      let firstOffsetY:number | undefined= 0;
      let firstOffsetWidth:number = 0;
      let firstOffsetHeight:number = 0;
      let secondOffsetX:number | undefined = 0;
      let secondOffsetY:number | undefined = 0;
      let secondOffsetWidth:number = 0;
      let secondOffsetHeight:number = 0;
      //Calculate offset and hot zone width and height
      if ('SetNumber' == data.testValue.describe) {
        offsetX = uiContext!.vp2px((data.testValue.setValue[0].x) as number);
        offsetY = uiContext!.vp2px((data.testValue.setValue[0].y) as number);
        offsetWidth = uiContext!.vp2px((data.testValue.setValue[0].width) as number);
        offsetHeight = uiContext!.vp2px((data.testValue.setValue[0].height) as number);
      } else if ('SetStringPx' == data.testValue.describe) {
        // offsetX = Number((data.testValue.setValue[0]).numberPxX);
        // offsetY = Number(data.testValue.setValue[0].numberPxY);
        // offsetWidth = Number(data.testValue.setValue[0].numberPxWidth);
        // offsetHeight = Number(data.testValue.setValue[0].numberPxHeight);
        offsetX = Number(100);
        offsetY = Number(100);
        offsetWidth = Number(200);
        offsetHeight = Number(200);
      } else if ('SetPercent' == data.testValue.describe) {
        // offsetX = rectWidth * Number(data.testValue.setValue[0].ratioX);
        // offsetY = rectHeight * Number(data.testValue.setValue[0].ratioY);
        // offsetWidth = rectWidth * Number(data.testValue.setValue[0].ratioWidth);
        // offsetHeight = rectHeight * Number(data.testValue.setValue[0].ratioHeight);
        offsetX = rectWidth * Number(0.2);
        offsetY = rectHeight * Number(0.2);
        offsetWidth = rectWidth * Number(1.0);
        offsetHeight = rectHeight * Number(1.0);
      } else if ('SetResource' == data.testValue.describe) {
        // offsetX = Number(uiContext!.vp2px(data.testValue.setValue[0].numberX));
        // offsetY = Number(uiContext!.vp2px(data.testValue.setValue[0].numberY));
        // offsetWidth = Number(uiContext!.vp2px(data.testValue.setValue[0].numberWidth));
        // offsetHeight = Number(uiContext!.vp2px(data.testValue.setValue[0].numberHeight));
        offsetX = Number(uiContext!.vp2px(50));
        offsetY = Number(uiContext!.vp2px(50));
        offsetWidth = Number(uiContext!.vp2px(200));
        offsetHeight = Number(uiContext!.vp2px(200));
      } else if (('SetIntraArea' == data.testValue.describe) ||
        ('SetOutsideArea' == data.testValue.describe)) {
        offsetX = uiContext!.vp2px((data.testValue.setValue[0].x) as number);
        offsetY = uiContext!.vp2px((data.testValue.setValue[0].y) as number);
        // offsetWidth = rectWidth * Number(data.testValue.setValue[0].ratioWidth);
        // offsetHeight = rectHeight * Number(data.testValue.setValue[0].ratioHeight);
        offsetWidth = rectWidth * Number(1.0);
        offsetHeight = rectHeight * Number(1.0);
      } else if ('SetMultiArea' == data.testValue.describe) {
        firstOffsetX = uiContext!.vp2px((data.testValue.setValue[0].x) as number);
        firstOffsetY = uiContext!.vp2px((data.testValue.setValue[0].y) as number);
        // firstOffsetWidth = rectWidth * Number(data.testValue.setValue[0].ratioWidth);
        // firstOffsetHeight = rectHeight * Number(data.testValue.setValue[0].ratioHeight);
        firstOffsetWidth = rectWidth * Number(1.0);
        firstOffsetHeight = rectHeight * Number(1.0);
        secondOffsetX = uiContext!.vp2px((data.testValue.setValue[1].x) as number);
        secondOffsetY = uiContext!.vp2px((data.testValue.setValue[1].y) as number);
        // secondOffsetWidth = rectWidth * Number(data.testValue.setValue[1].ratioWidth);
        // secondOffsetHeight = rectHeight * Number(data.testValue.setValue[1].ratioHeight);
        secondOffsetWidth = rectWidth * Number(1.0);
        secondOffsetHeight = rectHeight * Number(1.0);
      } else {
        console.info('[' + data.caseTag + ']' + 'describe is:' + data.testValue.describe);
      }
      if ('SetMultiArea' == data.testValue.describe) {
        //Click on the center point of multiple hot areas
        let xPoint = Number(Number(rect.left + (firstOffsetX as number) + (firstOffsetWidth as number) / 2).toFixed(0));
        let yPoint = Number(Number(rect.top + (firstOffsetY as number) + (firstOffsetHeight as number) / 2).toFixed(0));
        console.info('[' + data.caseTag + ']' + 'xPoint is:' + xPoint);
        console.info('[' + data.caseTag + ']' + 'yPoint is:' + yPoint);
        await clickPoint(data, xPoint, yPoint);

        xPoint = Number(Number(rect.left + (secondOffsetX as number) + (secondOffsetWidth as number) / 2).toFixed(0));
        yPoint = Number(Number(rect.top + (secondOffsetY as number) + (secondOffsetHeight as number) / 2).toFixed(0));
        console.info('[' + data.caseTag + ']' + 'xPoint is:' + xPoint);
        console.info('[' + data.caseTag + ']' + 'yPoint is:' + yPoint);
        await clickPoint(data, xPoint, yPoint);
        //Click on the outer points of multiple hotspot areas
        if ((rect.left + (firstOffsetX as number) + (firstOffsetWidth as number)) >= (rect.left + (secondOffsetX as number) + (secondOffsetY as number))) {
          xPoint = Number(Number(rect.left + (firstOffsetX as number) + (firstOffsetWidth as number) + Number(uiContext!.vp2px(10))).toFixed(0));
          yPoint = Number(Number(rect.top + (firstOffsetY as number) + (firstOffsetHeight as number) + Number(uiContext!.vp2px(10))).toFixed(0));
        } else {
          xPoint = Number(Number(rect.left + (secondOffsetX as number) + (secondOffsetWidth as number) + Number(uiContext!.vp2px(10))).toFixed(0));
          yPoint = Number(Number(rect.top + (secondOffsetY as number) + (secondOffsetHeight as number) + Number(uiContext!.vp2px(10))).toFixed(0));
        }
        console.info('[' + data.caseTag + ']' + 'xPoint is:' + xPoint);
        console.info('[' + data.caseTag + ']' + 'yPoint is:' + yPoint);
        // await Utils.performClickPoint(xPoint, yPoint);
        await eventResult(data, notClick);
      } else {
        //Click on the center point of the hotspot area
        let xPoint:number = Number(Number(rect.left + (offsetX as number) + (offsetWidth as number) / 2).toFixed(0));
        let yPoint:number = 0;
        if ('Panel' == data.pageConfig.componentKey) {
          // dragbar has height and do not reponse click event when click the dragbar  drgabar height = uiContext.uiContext!.vp2px(24)
          yPoint = Number(Number(rect.top + (offsetY as number) + 20 ).toFixed(0));
        } else {
          yPoint = Number(Number(rect.top + (offsetY as number) + (offsetHeight as number) / 2).toFixed(0));
        }
        console.info('[' + data.caseTag + ']' + 'xPoint is:' + xPoint);
        console.info('[' + data.caseTag + ']' + 'yPoint is:' + yPoint);
        await clickPoint(data, xPoint, yPoint);
        //Click on the outer point of the hotspot area
        xPoint = Number(Number(rect.left + (offsetX as number) + (offsetWidth as number) + Number(uiContext!.vp2px(10))).toFixed(0));
        yPoint = Number(Number(rect.top + (offsetY as number) + (offsetHeight as number) + Number(uiContext!.vp2px(10))).toFixed(0));
        console.info('[' + data.caseTag + ']' + 'xPoint is:' + xPoint);
        console.info('[' + data.caseTag + ']' + 'yPoint is:' + yPoint);
        await Utils.performClickPoint(xPoint, yPoint);
        await eventResult(data, notClick);
      }
    });
  })


}
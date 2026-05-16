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
import { describe, beforeAll, expect,afterEach } from '../../../../hypium/index';
import { UIContext } from "@ohos.arkui.UIContext";
import { $r,  Rectangle } from '@ohos.arkui.component'
import { AttrsManager } from '../../../ets/MainAbility/common/AttrsManager';
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
  // AttrsManager.change(data.caseTag, data.testValue.setValue);
  AppStorage.setOrCreate<Array<Rectangle>>('_responseRegion', data.testValue.setValue as Array<Rectangle>)
  AppStorage.setOrCreate<string>('eventCallBackStr', 'notOnClick')
  AppStorage.setOrCreate<string>('eventCallBackStr', '')
  await Utils.sleep(1000);
}

async function eventResult(data: BasePageConfig, expectationValue: string) {
  let referenceComponent: jsonx.JsonElement = Utils.getComponentByKey(data.pageConfig.referenceComponentKey);
  await Utils.sleep(1000);
  console.info('[' + data.caseTag + ']' + 'content is:' + referenceComponent.getElement('$attrs').getString('content'));
  console.log('data.pageConfig.referenceComponentKey',data.pageConfig.referenceComponentKey) //data.pageConfig.referenceComponentKey referenceComponentKey
  if ('' == expectationValue) {
    console.log('=============wj1',referenceComponent.getElement('$attrs').getString('content'),'expectationValue:',expectationValue)
    expect(referenceComponent.getElement('$attrs').getString('content')).assertEqual(expectationValue);  // expect onClick,  equals
  } else {
    console.log('=============wj2',referenceComponent.getElement('$attrs').getString('content'),'expectationValue:',expectationValue)
    expect(referenceComponent.getElement('$attrs').getString('content')).assertContain(expectationValue);
  }
}



export default function responseRegionTest() {
  console.log('+++++++++++responseRegionTest start')
  let supportView:Array<string> = new Array<string>(
    'AlphabetIndexer',
    'Button',
    'Blank',
    'Checkbox',
    'CheckboxGroup',
    'DataPanel',
    'Divider',
    'Gauge',
    'Image',
    'ImageAnimator',
    'LoadingProgress',
    'Marquee',
    'Menu',
    'MenuItem',
    'MenuItemGroup',
    // 'NavRouter',//appDied  废弃 不用管
    'Progress',
    'QRCode',
    'Radio',
    'Rating',
    'ScrollBar',
    'Slider',
    'TabContent'
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
    }
    },
    {
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
       } ],
       expectValue: {
         responseRegion: [{
           x: '100.00px', y: '100.00px', width: '200.00px', height: '200.00px'
         }]
       }
     },
     {
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
     },
     {
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
     },
     {
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
     },
     {
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
     },
     {
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
  console.log('++++++++++++++++++++++testValues123456',JSON.stringify(testValues))

  describe('ResponseRegionTest', () => {

    beforeAll(() => {
      console.info("ResponseRegionTest beforeEach start");
      await UtilsTest.startAbility("com.acts.arkui.component.common.attrs.test.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    afterEach(() => {
      AppStorage.setOrCreate<Array<Rectangle>>('_responseRegion', [{ x: 0, y: 0, width: '100%', height: '100%' } ])
      AppStorage.setOrCreate<string>('eventCallBackStr', 'notOnClick')
      AppStorage.setOrCreate<string>('eventCallBackStr', '')
      await Utils.sleep(2000);
    })

    console.log('++++++++++++++++++++++testValues123',JSON.stringify(testValues))
    CommonTest.initTest(pageConfig, supportView, testValues, async (data: BasePageConfig): Promise<void> => {
      //Get the initial region information of the target component
      console.info('[' + data.caseTag + '] get Component rect before position changed.');
      let rect: RectValue = Utils.getComponentRect(data.pageConfig.componentKey);
      let rectHeight = rect.bottom - rect.top;
      let rectWidth = rect.right - rect.left;
      console.info('[' + data.caseTag + '] setValue : ' + String(data.testValue.setValue));  // ] setValue : [{}] 值是空
      // AttrsManager.change(data.caseTag, data.testValue.setValue);
      AppStorage.setOrCreate<Array<Rectangle>>('_responseRegion', data.testValue.setValue)
      AppStorage.setOrCreate<string>('eventCallBackStr', 'notOnClick')
      AppStorage.setOrCreate<string>('eventCallBackStr', '')
      await Utils.sleep(2000);
      console.info('wj--'+JSON.stringify(data.pageConfig.componentKey))
      let viewObj: jsonx.JsonElement = Utils.getComponentByKey(data.pageConfig.componentKey);
      await Utils.sleep(2000);
      console.info('[wll]viewObj'+JSON.stringify(viewObj.toString()))
      console.info('+++++++describe'+data.testValue.describe)
      // console.info('[wllabc]'+JSON.stringify(data.testValue.expectValue?.responseRegion))
      if ('SetMultiArea' == data.testValue.describe) {
        expect(JSON.stringifyJsonElement(viewObj.getElement('$attrs').getElement('responseRegion')[0]).replaceAll('\\', ''))
          .assertEqual(`"${JSON.stringify(data.testValue.expectValue?.responseRegion[0])}"`);
        expect(JSON.stringifyJsonElement(viewObj.getElement('$attrs').getElement('responseRegion')[1]).replaceAll('\\', ''))
          .assertEqual(`"${JSON.stringify(data.testValue.expectValue?.responseRegion[1])}"`);
      }
      else {
        console.log("==============================1 " + JSON.stringifyJsonElement(viewObj.getElement('$attrs').getArray('responseRegion')[0]))
        console.log("==============================2 " + JSON.stringify(data.testValue.expectValue?.responseRegion[0]))
        console.log("==============================3 " + JSON.stringify(data.testValue.expectValue?.responseRegion[0].x))
        console.log("==============================4 " + String(data.testValue.expectValue?.responseRegion[0]))
        expect(String(viewObj.getElement('$attrs').getArray('responseRegion')[0])).assertEqual(String(data.testValue.expectValue?.responseRegion[0]));
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
      let uiContext =  AppStorage.get<UIContext>('uiContext');
      if ('SetNumber' == data.testValue.describe) {
        console.log('11222222')
        offsetX = Number(uiContext!.vp2px(Number(data.testValue.setValue[0].x as number)));
        offsetY = Number(uiContext!.vp2px(Number(data.testValue.setValue[0].y as number)));
        offsetWidth = Number(uiContext!.vp2px(Number(data.testValue.setValue[0].width as number)));
        offsetHeight = Number(uiContext!.vp2px(Number(data.testValue.setValue[0].height as number)));
      }
      else if ('SetStringPx' == data.testValue.describe) {
        // offsetX = (data.testValue.setValue[0].numberPxX as number);  //被替换
        // offsetY = (data.testValue.setValue[0].numberPxY as number);  //被替换
        offsetX = 100;
        offsetY = 100;
        // offsetWidth = (data.testValue.setValue[0].numberPxWidth as number);  //被替换
        // offsetHeight = (data.testValue.setValue[0].numberPxHeight as number);  //被替换
        offsetWidth = 200;
        offsetHeight = 200;
      }
      else if ('SetPercent' == data.testValue.describe) {
        // offsetX = rectWidth * (data.testValue.setValue[0].ratioX as number);  //被替换
        // offsetY = rectHeight * (data.testValue.setValue[0].ratioY as number);  //被替换
        offsetX = rectWidth * 0.2;
        offsetY = rectHeight * 0.2;
        // offsetWidth = rectWidth * (data.testValue.setValue[0].ratioWidth as number);  //被替换
        // offsetHeight = rectHeight * (data.testValue.setValue[0].ratioHeight as number);  //被替换
        offsetWidth = rectWidth * 1.0;
        offsetHeight = rectHeight * 1.0;
      }
      else if ('SetResource' == data.testValue.describe) {
        // offsetX = Number(vp2px(data.testValue.setValue[0].numberX));  //被替换
        // offsetY = Number(vp2px(data.testValue.setValue[0].numberY));  //被替换
        offsetX = Number(uiContext!.vp2px(50));
        offsetY = Number(uiContext!.vp2px(50));
        // offsetWidth = Number(vp2px(data.testValue.setValue[0].numberWidth));  //被替换
        // offsetHeight = Number(vp2px(data.testValue.setValue[0].numberHeight));  //被替换
        offsetWidth = Number(uiContext!.vp2px(200));
        offsetHeight = Number(uiContext!.vp2px(200));
      }
      else if (('SetIntraArea' == data.testValue.describe) || ('SetOutsideArea' == data.testValue.describe)) {
        offsetX = uiContext!.vp2px((data.testValue.setValue[0].x) as number);
        offsetY = uiContext!.vp2px((data.testValue.setValue[0].y) as number);
        // offsetWidth = rectWidth * (data.testValue.setValue[0].ratioWidth as number);  //被替换
        // offsetHeight = rectHeight * (data.testValue.setValue[0].ratioHeight as number);  //被替换
        offsetWidth = rectWidth * 1.0;
        offsetHeight = rectHeight * 1.0;
      }
      else if ('SetMultiArea' == data.testValue.describe) {
        firstOffsetX = uiContext!.vp2px((data.testValue.setValue[0].x) as number);
        firstOffsetY = uiContext!.vp2px((data.testValue.setValue[0].y) as number);
        // firstOffsetWidth = rectWidth * (data.testValue.setValue[0].ratioWidth as number);  //被替换
        // firstOffsetHeight = rectHeight * (data.testValue.setValue[0].ratioHeight as number);  //被替换
        firstOffsetWidth = rectWidth * 1.0;
        firstOffsetHeight = rectHeight * 1.0;
        secondOffsetX = uiContext!.vp2px((data.testValue.setValue[1].x) as number);
        secondOffsetY = uiContext!.vp2px((data.testValue.setValue[1].y) as number);
        // secondOffsetWidth = rectWidth * (data.testValue.setValue[1].ratioWidth as number);  //被替换
        // secondOffsetHeight = rectHeight * (data.testValue.setValue[1].ratioHeight as number);  //被替换
        secondOffsetWidth = rectWidth * 1.0;
        secondOffsetHeight = rectHeight * 1.0;
      }
      else {
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
        await Utils.performClickPoint(xPoint, yPoint);
        await eventResult(data, notClick);
      }
      else {
        //Click on the center point of the hotspot area
        let xPoint:number = Number(Number(rect.left + (offsetX) + offsetWidth / 2).toFixed(0));
        let yPoint:number = 0;
        if ('Panel' == data.pageConfig.componentKey) {
          // dragbar has height and do not reponse click event when click the dragbar  drgabar height = uiContext.vp2px(24)
          yPoint = Number(Number(rect.top + (offsetY as number) + 20 ).toFixed(0));
        } else {
          yPoint = Number(Number(rect.top + (offsetY) + (offsetHeight ) / 2).toFixed(0));
        }
        console.info('[' + data.caseTag + ']' + 'xPoint is:' + xPoint);
        console.info('[' + data.caseTag + ']' + 'yPoint is:' + yPoint);
        await clickPoint(data, xPoint, yPoint); //好像是这里的reset没执行
        //Click on the outer point of the hotspot area
        xPoint = Number(Number(rect.left + (offsetX ) + (offsetWidth) + Number(uiContext!.vp2px(10))).toFixed(0));
        yPoint = Number(Number(rect.top + (offsetY) + (offsetHeight) + Number(uiContext!.vp2px(10))).toFixed(0));
        console.info('[' + data.caseTag + ']' + 'xPoint is:' + xPoint);
        console.info('[' + data.caseTag + ']' + 'yPoint is:' + yPoint);
        console.log("====================================== Utils.performClickPoint 1");
        await Utils.performClickPoint(xPoint, yPoint);
        console.log("====================================== Utils.performClickPoint 2");
        console.log(console);
        await eventResult(data, notClick);
      }
    });
  })


}
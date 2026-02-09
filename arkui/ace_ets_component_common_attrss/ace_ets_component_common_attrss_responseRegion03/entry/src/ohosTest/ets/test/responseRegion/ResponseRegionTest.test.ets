/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import { AttrsManager } from '../../MainAbility/common/AttrsManager';
import CommonTest from '../common/CommonTest';
import { describe, expect } from '@ohos/hypium';
import Utils from '../../MainAbility/common/Utils';

async function clickPoint(data: ESObject, xPoint: number, yPoint: number) {
  await Utils.performClickPoint(xPoint, yPoint);
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

async function resetStatus(data: ESObject) {
  console.info('[' + data.caseTag + '] reset status.');
  AttrsManager.change(data.caseTag, data.testValue.setValue);
  await Utils.sleep(1000);
}

async function eventResult(data: ESObject, expectationValue: ESObject) {
  await Utils.sleep(1000);
  let referenceComponent: ESObject = Utils.getComponentByKey(data.pageConfig.referenceComponentKey);
  console.info('[' + data.caseTag + ']' + 'content is:' + referenceComponent.$attrs.content);
  if ('' == expectationValue) {
    expect(referenceComponent.$attrs.content).assertEqual(expectationValue);
  } else {
    expect(referenceComponent.$attrs.content).assertContain(expectationValue);
  }
}

class PageConfig {
  testName: string = '';
  pageName: string = '';
  pageUrl: string = '';
  targetHeight: number = 0;
  targetWidth: number = 0;
  referenceComponentKey: string = '';
  referenceText: string = '';
}

class TestValues {
  describe: string = '';
  setValue: ESObject;
  expectValue?: ResponseRegion;
  exceptView?: ESObject;
}

class ResponseRegion {
  responseRegion: ESObject;
}

export default function responseRegionTest() {
  let supportView = [
    'Navigator',
    'Panel',
    'Refresh',
    'RelativeContainer',
    'Row',
    'Scroll',
    'Stack',
    'Swiper',
    'Tabs',
    'Circle',
    'Ellipse',
    'Polyline',
    'Polygon',
    'Path',
    'Rect',
    'Shape',
    'Line'
  ]
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

  let testValues: TestValues[] = [{
    describe: 'SetNumber',
    setValue: {
      x: 50, y: 50, width: 200, height: 200
    },
    expectValue: {
      responseRegion: {
        x: '50.00vp', y: '50.00vp', width: '200.00vp', height: '200.00vp'
      }
    }
  }, {
    describe: 'SetStringPx',
    setValue: {
      x: '100px',
      y: '100px',
      width: '200px',
      height: '200px',
      numberPxX: 100,
      numberPxY: 100,
      numberPxWidth: 200,
      numberPxHeight: 200
    },
    expectValue: {
      responseRegion: {
        x: '100.00px', y: '100.00px', width: '200.00px', height: '200.00px'
      }
    }
  }, {
    describe: 'SetPercent',
    setValue: {
      x: '20%',
      y: '20%',
      width: '100%',
      height: '100%',
      ratioX: 0.2,
      ratioY: 0.2,
      ratioWidth: 1.0,
      ratioHeight: 1.0
    },
    expectValue: {
      responseRegion: {
        x: '20.00%', y: '20.00%', width: '100.00%', height: '100.00%'
      }
    }
  }, {
    describe: 'SetResource',
    setValue: {
      x: $r('app.float.50vp'),
      y: $r('app.float.50vp'),
      width: $r('app.float.200vp'),
      height: $r('app.float.200vp'),
      numberX: 50,
      numberY: 50,
      numberWidth: 200,
      numberHeight: 200
    },
    expectValue: {
      responseRegion: {
        x: '50.00vp', y: '50.00vp', width: '200.00vp', height: '200.00vp'
      }
    }
  }, {
    describe: 'SetOutsideArea',
    setValue: {
      x: -200,
      y: 0,
      width: '100%',
      height: '100%',
      ratioWidth: 1.0,
      ratioHeight: 1.0
    },
    expectValue: {
      responseRegion: {
        x: '-200.00vp', y: '0.00vp', width: '100.00%', height: '100.00%'
      }
    }
  }, {
    describe: 'SetIntraArea',
    setValue: {
      x: 0,
      y: 0,
      width: '100%',
      height: '100%',
      ratioWidth: 1.0,
      ratioHeight: 1.0
    },
    expectValue: {
      responseRegion: {
        x: '0.00vp', y: '0.00vp', width: '100.00%', height: '100.00%'
      }
    }
  }, {
    describe: 'SetMultiArea',
    exceptView: ['Search'],
    setValue: [{
      x: 0,
      y: 0,
      width: '100%',
      height: '100%',
      ratioWidth: 1.0,
      ratioHeight: 1.0
    }, {
      x: -200,
      y: -200,
      width: '100%',
      height: '100%',
      ratioWidth: 1.0,
      ratioHeight: 1.0
    }],
    expectValue: {
      responseRegion: [{
        x: '0.00vp', y: '0.00vp', width: '100.00%', height: '100.00%'
      }, {
        x: '-200.00vp', y: '-200.00vp', width: '100.00%', height: '100.00%'
      }]
    }
  }]

  describe('ResponseRegionTest', () => {
    CommonTest.initTest(pageConfig, supportView, testValues, null, async (data: ESObject) => {
      //Get the initial region information of the target component
      console.info('[' + data.caseTag + '] get Component rect before position changed.');
      let rect: ESObject = Utils.getComponentRect(data.pageConfig.componentKey);
      let rectHeight = rect.bottom - rect.top;
      let rectWidth = rect.right - rect.left;
      console.info('[' + data.caseTag + '] setValue : ' + JSON.stringify(data.testValue.setValue));
      AttrsManager.change(data.caseTag, data.testValue.setValue);
      await Utils.sleep(1000);
      let viewObj: ESObject = Utils.getComponentByKey(data.pageConfig.componentKey);
      if ('SetMultiArea' == data.testValue.describe) {
        expect(viewObj.$attrs.responseRegion[0])
          .assertEqual(JSON.stringify(data.testValue.expectValue.responseRegion[0]));
        expect(viewObj.$attrs.responseRegion[1])
          .assertEqual(JSON.stringify(data.testValue.expectValue.responseRegion[1]));
      } else {
        expect(viewObj.$attrs.responseRegion[0])
          .assertEqual(JSON.stringify(data.testValue.expectValue.responseRegion));
      }
      let offsetX = 0;
      let offsetY = 0;
      let offsetHeight = 0;
      let offsetWidth = 0;
      let firstOffsetX = 0;
      let firstOffsetY = 0;
      let firstOffsetWidth = 0;
      let firstOffsetHeight = 0;
      let secondOffsetX = 0;
      let secondOffsetY = 0;
      let secondOffsetWidth = 0;
      let secondOffsetHeight = 0;
      //Calculate offset and hot zone width and height
      if ('SetNumber' == data.testValue.describe) {
        offsetX = vp2px(data.testValue.setValue.x);
        offsetY = vp2px(data.testValue.setValue.y);
        offsetWidth = vp2px(data.testValue.setValue.width);
        offsetHeight = vp2px(data.testValue.setValue.height);
      } else if ('SetStringPx' == data.testValue.describe) {
        offsetX = data.testValue.setValue.numberPxX;
        offsetY = data.testValue.setValue.numberPxY;
        offsetWidth = data.testValue.setValue.numberPxWidth;
        offsetHeight = data.testValue.setValue.numberPxHeight;
      } else if ('SetPercent' == data.testValue.describe) {
        offsetX = rectWidth * data.testValue.setValue.ratioX;
        offsetY = rectHeight * data.testValue.setValue.ratioY;
        offsetWidth = rectWidth * data.testValue.setValue.ratioWidth;
        offsetHeight = rectHeight * data.testValue.setValue.ratioHeight;
      } else if ('SetResource' == data.testValue.describe) {
        offsetX = vp2px(data.testValue.setValue.numberX);
        offsetY = vp2px(data.testValue.setValue.numberY);
        offsetWidth = vp2px(data.testValue.setValue.numberWidth);
        offsetHeight = vp2px(data.testValue.setValue.numberHeight);
      } else if (('SetIntraArea' == data.testValue.describe) ||
        ('SetOutsideArea' == data.testValue.describe)) {
        offsetX = vp2px(data.testValue.setValue.x);
        offsetY = vp2px(data.testValue.setValue.y);
        offsetWidth = rectWidth * data.testValue.setValue.ratioWidth;
        offsetHeight = rectHeight * data.testValue.setValue.ratioHeight;
      } else if ('SetMultiArea' == data.testValue.describe) {
        firstOffsetX = vp2px(data.testValue.setValue[0].x);
        firstOffsetY = vp2px(data.testValue.setValue[0].y);
        firstOffsetWidth = rectWidth * data.testValue.setValue[0].ratioWidth;
        firstOffsetHeight = rectHeight * data.testValue.setValue[0].ratioHeight;
        secondOffsetX = vp2px(data.testValue.setValue[1].x);
        secondOffsetY = vp2px(data.testValue.setValue[1].y);
        secondOffsetWidth = rectWidth * data.testValue.setValue[1].ratioWidth;
        secondOffsetHeight = rectHeight * data.testValue.setValue[1].ratioHeight;
      } else {
        console.info('[' + data.caseTag + ']' + 'describe is:' + data.testValue.describe);
      }
      if ('SetMultiArea' == data.testValue.describe) {
        //Click on the center point of multiple hot areas
        let xPoint = Number(Number(rect.left + firstOffsetX + firstOffsetWidth / 2).toFixed(0));
        let yPoint = Number(Number(rect.top + firstOffsetY + firstOffsetHeight / 2).toFixed(0));
        console.info('[' + data.caseTag + ']' + 'xPoint is:' + xPoint);
        console.info('[' + data.caseTag + ']' + 'yPoint is:' + yPoint);
        await clickPoint(data, xPoint, yPoint);

        xPoint = Number(Number(rect.left + secondOffsetX + secondOffsetWidth / 2).toFixed(0));
        yPoint = Number(Number(rect.top + secondOffsetY + secondOffsetHeight / 2).toFixed(0));
        console.info('[' + data.caseTag + ']' + 'xPoint is:' + xPoint);
        console.info('[' + data.caseTag + ']' + 'yPoint is:' + yPoint);
        await clickPoint(data, xPoint, yPoint);
        //Click on the outer points of multiple hotspot areas
        if ((rect.left + firstOffsetX + firstOffsetWidth) >= (rect.left + secondOffsetX + secondOffsetY)) {
          xPoint = Number(Number(rect.left + firstOffsetX + firstOffsetWidth + vp2px(10)).toFixed(0));
          yPoint = Number(Number(rect.top + firstOffsetY + firstOffsetHeight + vp2px(10)).toFixed(0));
        } else {
          xPoint = Number(Number(rect.left + secondOffsetX + secondOffsetWidth + vp2px(10)).toFixed(0));
          yPoint = Number(Number(rect.top + secondOffsetY + secondOffsetHeight + vp2px(10)).toFixed(0));
        }
        console.info('[' + data.caseTag + ']' + 'xPoint is:' + xPoint);
        console.info('[' + data.caseTag + ']' + 'yPoint is:' + yPoint);
        await Utils.performClickPoint(xPoint, yPoint);
        await eventResult(data, notClick);
      } else {
        //Click on the center point of the hotspot area
        let xPoint = Number(Number(rect.left + offsetX + offsetWidth / 2).toFixed(0));
        let yPoint = 0;
        if ('Panel' == data.pageConfig.componentKey) {
             // dragbar has height and do not reponse click event when click the dragbar  drgabar height = vp2px(24)
             yPoint = Number(Number(rect.top + offsetY + 20 ).toFixed(0));
        } else {
             yPoint = Number(Number(rect.top + offsetY + offsetHeight / 2).toFixed(0));
        }
        console.info('[' + data.caseTag + ']' + 'xPoint is:' + xPoint);
        console.info('[' + data.caseTag + ']' + 'yPoint is:' + yPoint);
        await clickPoint(data, xPoint, yPoint);
        //Click on the outer point of the hotspot area
        xPoint = Number(Number(rect.left + offsetX + offsetWidth + vp2px(10)).toFixed(0));
        yPoint = Number(Number(rect.top + offsetY + offsetHeight + vp2px(10)).toFixed(0));
        console.info('[' + data.caseTag + ']' + 'xPoint is:' + xPoint);
        console.info('[' + data.caseTag + ']' + 'yPoint is:' + yPoint);
        await Utils.performClickPoint(xPoint, yPoint);
        await eventResult(data, notClick);
      }
    });
  })


}
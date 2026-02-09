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
import CommonTest from '../common/CommonTest';
import { beforeAll, describe, expect } from '../../../../hypium/index';
import { BasePageConfig, PageConfig, SetValue, TestValue } from '../../../ets/MainAbility/common/Utils';
import { startAbility, UtilsTest } from '../Util.test';
import { AppStorage } from '@ohos.arkui.stateManagement';

/**
 * Test of common attribute: responseRegion
 */
export default function responseRegionTest() {
  //A list of components that support padding attributes is required.
  let supportView = [
    'Button',
  ]

  //Page related configuration, this parameter is required.
  let targetComponentWidth = 200;
  let targetComponentHeight = 200;
  let parentWidth = 320;
  let parentHeight = 200;
  let gutter = 10;
  let columns = 3;
  let pageConfig: PageConfig = {
    testName: 'testResponseRegion',
    pageName: 'ResponseRegionPage',
    pageUrl: 'MainAbility/pages/responseRegion/ResponseRegionPage',
    targetComponentHeight: targetComponentHeight,
    targetComponentWidth: targetComponentWidth,
    parentHeight: parentHeight,
    parentWidth: parentWidth,
    referenceComponentKey: 'referenceComponentKey',
    parentComponentKey: 'parentComponentKey',
    gutter: gutter,
    columns: columns
  }

  //The data type to be tested, this parameter is required.
  let testValues: TestValue[] = [{
    describe: 'SetResponseRegion',
    setValue: {
      responseRegion: [{
        x: 1.0,
        y: 2.0,
        width: '70%',
        height: '30%'
      }]
    },
    expectValue: {
      responseRegion: [{
        x: '1.00vp',
        y: '2.00vp',
        width: '70.00%',
        height: '30.00%'
      }]
    }
  }]

  /**
   * Create test suite.
   */
  describe('responseRegionTest', () => {
    beforeAll(() => {
      
      await startAbility("com.acts.arkui.component.common.attrs.test.static", "EntryAbility")
      await UtilsTest.msSleep(4000);
      
    });

    CommonTest.initTest(pageConfig, supportView, testValues, async (data: BasePageConfig): Promise<void> => {
      console.info('[' + data.caseTag + ']' + 'responseRegion is:' +
      data.viewObj!.getElement('$attrs').getArray('responseRegion'));

      console.info(data.viewObj + 'data.viewObj00');
      console.info(data.viewObj!.getElement('$attrs') + 'data.viewObj11');
      console.info(JSON.stringify(data.viewObj!.getElement('$attrs').getArray('responseRegion')[0]) +
        'data.viewObj22');
      console.info(JSON.stringify(data.viewObj!.getElement('$attrs').getArray('responseRegion')[0].toString()) +
        'data.viewObj33');
      console.info(data.viewObj!.getElement('$attrs').getArray('responseRegion')[0].toString() +
        'data.viewObj44')
      expect(JSON.parseJsonElement(data.viewObj!.getElement('$attrs').getArray('responseRegion')[0].asString())
        .getString('x'))
        .assertEqual(data.testValue.expectValue.responseRegion[0].x);
      expect(JSON.parseJsonElement(data.viewObj!.getElement('$attrs').getArray('responseRegion')[0].asString())
        .getString('y'))
        .assertEqual(data.testValue.expectValue.responseRegion[0].y);
      expect(JSON.parseJsonElement(data.viewObj!.getElement('$attrs').getArray('responseRegion')[0].asString())
        .getString('width'))
        .assertEqual(data.testValue.expectValue.responseRegion[0].width);
      expect(JSON.parseJsonElement(data.viewObj!.getElement('$attrs').getArray('responseRegion')[0].asString())
        .getString('height'))
        .assertEqual(data.testValue.expectValue.responseRegion[0].height);
    });
  })
}
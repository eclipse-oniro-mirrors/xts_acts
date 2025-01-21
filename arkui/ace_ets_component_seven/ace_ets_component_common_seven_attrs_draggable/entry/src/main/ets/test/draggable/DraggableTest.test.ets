/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, expect } from '@ohos/hypium'
import Utils from '../../MainAbility/common/Utils';

/**
 * Test of common attribute: draggable
 */
export default function draggableTest() {
  //A list of components that support padding attributes is required.
  let supportView = [
    'Image'
  ]

  //Page related configuration, this parameter is required.
  let targetComponentWidth = 200;
  let targetComponentHeight = 200;
  let parentWidth = 320;
  let parentHeight = 200;
  let gutter = 10;
  let columns = 3;
  let pageConfig = {
    testName: 'testDraggable',
    pageName: 'DraggablePage',
    pageUrl: 'MainAbility/pages/draggable/DraggablePage',
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
  let testValues = [{
    describe: 'SetDraggable',
    setValue: {
      draggable: false
    },
    expectValue: {
      draggable: 'false'
    }
  }]

  /**
   * Create test suite.
   */
  describe('draggableTest', () => {
    CommonTest.initTest(pageConfig, supportView, testValues, async data => {
      console.error('[' + data.caseTag + '] draggableTest.');
      console.error('[' + data.caseTag + '] draggableTest. data.testValue.setValue.draggable : ' + data.testValue.setValue.draggable);
      console.error('[' + data.viewObj.$attrs.draggable + '] draggableTest. viewObj.$attrs.draggable.');
      console.error('[' + data.testValue.expectValue.draggable + '] draggableTest. data.testValue.expectValue.draggable.');
      expect(data.viewObj.$attrs.draggable).assertEqual(data.testValue.expectValue.draggable);
    });
  })
}
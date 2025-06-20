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
 * Test of common attribute: restoreId
 */
export default function restoreIdTest() {
  //A list of components that support padding attributes is required.
  let supportView = [
    'Button',
  ]

  //Page related configuration, this parameter is required.
  let targetComponentWrestoreIdth = 200;
  let targetComponentHeight = 200;
  let parentWrestoreIdth = 320;
  let parentHeight = 200;
  let gutter = 10;
  let columns = 3;
  let pageConfig:ESObject = {
    testName: 'testRestoreId',
    pageName: 'RestoreIdPage',
    pageUrl: 'MainAbility/pages/restoreId/RestoreIdPage',
    targetComponentHeight: targetComponentHeight,
    targetComponentWrestoreIdth: targetComponentWrestoreIdth,
    parentHeight: parentHeight,
    parentWrestoreIdth: parentWrestoreIdth,
    referenceComponentrestoreId: 'referenceComponentrestoreId',
    parentComponentrestoreId: 'parentComponentrestoreId',
    gutter: gutter,
    columns: columns
  }

  //The data type to be tested, this parameter is required.
  let testValues:ESObject[]= [{
    describe: 'SetRestoreId',
    setValue: {
     restoreId: 1
    } as ESObject,
    expectValue: {
     restoreId: 1
    } as ESObject
  }]

  /**
   * Create test suite.
   */
  describe('restoreIdTest', () => {
    CommonTest.initTest(pageConfig, supportView, testValues, async (data:ESObject) => {
      expect(true).assertTrue();
    });
  })
}
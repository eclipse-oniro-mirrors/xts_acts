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

import { afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium/index';
import inspector from '@ohos.arkui.inspector'
import CommonFunc from '../../../ets/MainAbility/common/Common';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import router from '@ohos.router';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function columnSplitJsunit() {


  describe('columnSplitTest', () => {
    beforeAll(() => {
      console.info("columnSplitTest beforeAll start");

      await UtilsTest.startAbility("com.arkui.ace.layout.nowear.api11.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("columnSplitTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Column/ColumnSplit',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get columnSplitTest state pages:" + "");
        if (!("ColumnSpaceResourcePage" == pages.name)) {
          console.info("get columnSplitTest pages.name:" + "");
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push columnSplitTest page error:" + err);
      }
      console.info("columnSplitTest beforeEach end");
    });


    afterEach(async () => {
      await UtilsTest.msSleep(1000)
      console.info("ColumnSplit after each called");
    });


    /**
     * @tc.number   testColumnSplit_static_010
     * @tc.name     testColumnSplit_static_010
     * @tc.desc     testColumnSplit_static_010
     * @tc.level    0
     */
    it('testColumnSplit_static_010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new columnSplit0 START');
      let strJson = inspector.getInspectorByKey('columnSplit');
      await UtilsTest.msSleep(1000)
      let obj = JSON.parseJsonElement(strJson);
      console.info("component obj is: " + strJson);
      expect(obj.getString('$type')).assertEqual('ColumnSplit');
      console.info("yr ColumnSplit0 type: " + obj.getString('$type'));
      expect(obj.getElement('$attrs').getString('resizeable')).assertEqual('true');
      console.info('new columnSplit0 END');
      done();
    })


    /**
     * @tc.number   testColumnSplit_static_020
     * @tc.name     testColumnSplit_static_020
     * @tc.desc     testColumnSplit_static_020
     * @tc.level    0
     */
    it('testColumnSplit_static_020', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new columnSplit1 START');
      let strJson = inspector.getInspectorByKey('columnSplit1');
      await UtilsTest.msSleep(1000)
      let obj = JSON.parseJsonElement(strJson);
      console.info("component obj is: " + strJson);
      expect(obj.getElement('$attrs').getString('resizeable')).assertEqual('false');
      console.info('new columnSplit1 END');
      done();
    })
  })
}

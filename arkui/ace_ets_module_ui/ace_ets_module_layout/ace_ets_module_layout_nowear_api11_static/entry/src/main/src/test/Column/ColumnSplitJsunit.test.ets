'use static';
/**
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
import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level
} from '../../../../hypium/index'
import Utils from '../../../ets/MainAbility/common/Utils';
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

interface optionsObj {
  uri: string
}

export default function ColumnSplitJsunit() {
  describe('ColumnSplitJsunit', () => {
    beforeAll(() => {
      console.info("ColumnSplitJsunit beforeAll start");

      await UtilsTest.startAbility("com.arkui.ace.layout.nowear.api11.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("ColumnSplitJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Column/columnSplitPage',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ColumnSplitJsunit state pages:" + "");
        if (!("ColumnSpaceResourcePage" == pages.name)) {
          console.info("get ColumnSplitJsunit pages.name:" + "");
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push ColumnSplitJsunit page error:" + err);
      }
      console.info("ColumnSplitJsunit beforeEach end");
    });


    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("columnSplit after each called");
    })


    /**
     * @tc.number   testColumnSplitResizeable_static_01
     * @tc.name     testColumnSplitResizeable_static_01
     * @tc.desc     testColumnSplitResizeable_static_01
     * @tc.level    0
     */
    it('testColumnSplitResizeable_static_01', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let tagName = 'testColumnSplitResizeable_static_01';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
      let strJson = inspector.getInspectorByKey('columnsplitkey');
      console.info('[' + tagName + '] component obj is: ' + strJson);
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('ColumnSplit');
      console.info('[' + tagName + '] END ===========================');
      done();
    });
  })
}

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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium';
import { Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import {UtilsTest,startAbility} from '../Util.test';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';

export default function subHeaderV2RightSymbol() {
  describe('subHeaderV2RightSymbol', () => {
    beforeAll(async (): Promise<void> => {
      console.info("subHeaderV2RightSymbol beforeEach start");
      await UtilsTest.startAbility("com.acts.arkui.subHeaderV2.nowear.test.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("subHeaderV2RightSymbol beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/subHeaderV2/subHeaderV2RightSymbol',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get subHeaderV2RightSymbol state pages:" + JSON.stringify(pages));
        if (!("subHeaderV2RightSymbol" == pages.name)) {
          console.info("get subHeaderV2RightSymbol pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push subHeaderV2RightSymbol page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push subHeaderV2RightSymbol page error:" + err);
      }
      console.info("subHeaderV2RightSymbol beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await Utils.sleep(1000);
      console.info('subHeaderV2RightSymbol after each called');
    })

    
    
    
    /**
     * @tc.number   subHeaderV2RightSymbol_static_0100
     * @tc.name     subHeaderV2RightSymbol_static_0100
     * @tc.desc     subHeaderV2RightSymbol_static_0100
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
it('subHeaderV2RightSymbol_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[subHeaderV2RightSymbol_static_0100] START');
      let driver = Driver.create();
      await driver.delayMs(2000);
      // subHeaderV2RightSymbol是否存在以下入口。
      let selectDemo = await driver.findComponent(ON.text('selectDemo'));
      expect(selectDemo !== null).assertTrue();
      await driver.delayMs(1000);
      console.info('[subHeaderV2RightSymbol_static_0100] END');
      done();
    });
  })
}
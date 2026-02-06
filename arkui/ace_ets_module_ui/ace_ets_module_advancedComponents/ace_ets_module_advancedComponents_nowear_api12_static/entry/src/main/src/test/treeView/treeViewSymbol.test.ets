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
import events_emitter from '@ohos.events.emitter';

export default function treeViewSymbol() {
  describe('treeViewSymbol', () => {

    beforeAll(() => {
      console.info("treeViewSymbol beforeEach start");
      await UtilsTest.startAbility("com.acts.arkui.component.common.attrs.nowear.test.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("treeViewSymbol beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/treeView/treeViewSymbol',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get treeViewSymbol state pages:" + JSON.stringify(pages));
        if (!("treeViewSymbol" == pages.name)) {
          console.info("get treeViewSymbol pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(4000);
          // console.info("push treeViewSymbol page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push treeViewSymbol page error:" + err);
      }
      console.info("treeViewSymbol beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await Utils.sleep(1000);
      console.info('treeViewSymbol after each called');
    })

    
    
    
    /**
     * @tc.number   treeViewSymbol_static_0100
     * @tc.name     treeViewSymbol_static_0100
     * @tc.desc     treeViewSymbol_static_0100
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
it('treeViewSymbol_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        console.info('[treeViewSymbol_static_0100] START');
          try{
            let driver = Driver.create();
            await driver.assertComponentExist(ON.text('ClickNodeId='));
          } finally {
            done();
          }
      } catch (error) {
        expect().assertFail();
      }
    })
  })
}
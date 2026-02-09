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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../hypium';
import router from '@ohos.router';
import CommonFunc from '../../ets/MainAbility/common/Common';
import { startAbility, UtilsTest } from './Util.test';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function curvesJsunit() {
  describe('curvesJsunit', () => {
    beforeAll(() => {
      console.info("curvesJsunit beforeEach start");
      
      await UtilsTest.startAbility("com.arkui.ace.animation.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("curvesJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Curves',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get curvesJsunit state pages:" + JSON.stringify(pages));
        if (!("curves" == pages.name)) {
          console.info("get curvesJsunit pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push curvesJsunit page error:" + err);
      }
      console.info("curvesJsunit beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("curves after each called");
    });
  })
}

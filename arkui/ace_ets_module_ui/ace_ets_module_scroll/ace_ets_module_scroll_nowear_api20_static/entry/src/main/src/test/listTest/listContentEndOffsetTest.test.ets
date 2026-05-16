'use static';
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import events_emitter from '@ohos.events.emitter';
import { Color,$r } from '@ohos.arkui.component'
import { describe, beforeEach, it, expect, Level, beforeAll, Size, TestType, afterEach } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../common/Common';

import { Driver, ON, MouseButton, Component } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { startAbility, UtilsTest } from '../Util.test.ets';
let domain: number = 0x0000;
let tag: string = 'testTag';

export default function ListContentEndOffsetTest() {
  describe('ListContentEndOffsetTest', () => {
    const SLEEP_TIME_1000 = 1000;
    beforeAll(async (): Promise<void> => {
      console.info('ListContentEndOffsetTest beforeAll start');
      await UtilsTest.startAbility('com.arkui.ace.scroll.nowear.api20.static', 'EntryAbility')
    });
    beforeEach(async (): Promise<void> => {
      console.info('ListContentEndOffsetTest beforeEach start');
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get ListContentEndOffsetTest state pages:' + JSON.stringify(pages));
        if (!('listContentEndOffset' == pages.name)) {
          console.info('get ListContentEndOffsetTest pages.name:' + JSON.stringify(pages.name));
          routerInstance.replaceUrl({
            url: 'MainAbility/pages/list/listContentEndOffset',
          })
        }
      } catch (err) {
        console.error('push ListContentEndOffsetTest page error:' + err);
      }
      console.info('ListContentEndOffsetTest foreEach end');
    });

    /**
     * @tc.number   ListContentEndOffset_static_0100
     * @tc.name     ListContentEndOffset_static_0100
     * @tc.desc     ListContentEndOffset_static_0100
     * @tc.level    Level.LEVEL2
     */
    it('ListContentEndOffset_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let tagName = 'ListContentEndOffset_static_0100';
      console.info('[' + tagName + '] START============================');
      await CommonFunc.sleep(SLEEP_TIME_1000);
      let strJson = inspector.getInspectorByKey('listContentEndOffset_001');
      let obj = JSON.parseJsonElement(strJson);
      let contentEndOffsetStr = obj.getElement('$attrs').getString('contentEndOffset');
      console.info('[ListContentEndOffset_static_0100] contentEndOffset obj is: ' + contentEndOffsetStr);
      expect(contentEndOffsetStr).assertEqual('60.000000');
      console.info('[' + tagName + '] END============================');
      await CommonFunc.sleep(SLEEP_TIME_1000);
      done();
    });

    /**
     * @tc.number   ListContentEndOffset_static_0200
     * @tc.name     ListContentEndOffset_static_0200
     * @tc.desc     ListContentEndOffset_static_0200
     * @tc.level    Level.LEVEL2
     */
    it('ListContentEndOffset_static_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let tagName = 'ListContentEndOffset_static_0200';
      console.info('[' + tagName + '] START============================');
      await CommonFunc.sleep(SLEEP_TIME_1000);
      let strJson = inspector.getInspectorByKey('listContentEndOffset_003');
      let obj = JSON.parseJsonElement(strJson);
      let contentEndOffsetStr = obj.getElement('$attrs').getString('contentEndOffset');
      console.info('[ListContentEndOffset_static_0200] contentEndOffset obj is: ' + contentEndOffsetStr);
      expect(contentEndOffsetStr).assertEqual('0.000000');
      console.info('[' + tagName + '] END============================');
      await CommonFunc.sleep(SLEEP_TIME_1000);
      done();
    });

    /**
     * @tc.number   ListContentEndOffset_static_0400
     * @tc.name     ListContentEndOffset_static_0400
     * @tc.desc     ListContentEndOffset_static_0400
     * @tc.level    Level.LEVEL2
     */
    it('ListContentEndOffset_static_0400', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let tagName = 'ListContentEndOffset_static_0400';
      console.info('[' + tagName + '] START============================');
      let strJson = inspector.getInspectorByKey('listContentEndOffset_004');
      let obj = JSON.parseJsonElement(strJson);
      let contentEndOffsetStr = obj.getElement('$attrs').getString('contentEndOffset');
      console.info('[ListContentEndOffset_static_0400] contentEndOffset obj is: ' + contentEndOffsetStr);
      expect(contentEndOffsetStr).assertEqual('0.000000');
      console.info('[' + tagName + '] END============================');
      await CommonFunc.sleep(SLEEP_TIME_1000);
      done();
    });

  })
}

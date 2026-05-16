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
import { beforeAll, beforeEach, describe, it, TestType, Size, Level, expect } from '../../../hypium/index';

import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { BusinessError,RecordData } from '@ohos.base';
import { Driver, ON } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import emitter from '@ohos.events.emitter';
import events_emitter from '@ohos.events.emitter';

import Utils from './Util.test';

export default function WebUrlRegexRules() {

  describe('ActsWebUrlRegexRulesTest', () => {

    beforeAll(async (): Promise<void> => {
      let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand('aa start -a EntryAbility -b com.open.harmony.injectjavascriptfourtest.static')
      await Utils.msSleep(8000)
      console.log('beforeAll end,%s', 'Succeed!')
    });

    beforeEach(async () => {
      console.info('web beforeEach start');
    })


    /**
     * @tc.name   testUrlRegexRulesStatic001
     * @tc.number SUB_WEB_URLREGEXRULES_STATIC_0100
     * @tc.desc   test runJavaScriptOnHeadEnd UrlRegexRules ok
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUrlRegexRulesStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: ()=> void):Promise<void> => {
        Utils.emitEvent('testUrlRegexRules001', 251224)
        await Utils.msSleep(7000);
        Utils.registerBaseEvent('testUrlRegexRules001', 'scriptHead:http urlRegexRules ok', 25122401, done,
          (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          const action = data['ACTION'];
          console.info(`Begin to assert [` + action + `] Equal [` + expected + `]`);
          expect(action).assertEqual(expected);
        });

        inspector.sendEventByKey('UrlRegexRules', 10, '');
        await Utils.msSleep(7000);
        done();
    })

    /**
     * @tc.name   testUrlRegexRulesStatic002
     * @tc.number SUB_WEB_URLREGEXRULES_STATIC_0200
     * @tc.desc   test runJavaScriptOnDocumentStart UrlRegexRules ok
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUrlRegexRulesStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: ()=> void):Promise<void> => {
        Utils.emitEvent('testUrlRegexRules002', 251224)
        Utils.registerBaseEvent('testUrlRegexRules002', 'scriptDOMStart:http urlRegexRules ok', 25122402, done,
          (backData: events_emitter.EventData, expected: Object) => {
            const data = backData?.data as Record<string, RecordData>;
            const action = data['ACTION'];
            console.info(`Begin to assert [` + action + `] Equal [` + expected + `]`);
            expect(action).assertEqual(expected);
          });
        inspector.sendEventByKey('UrlRegexRules', 10, '');
        await Utils.msSleep(7000);
        done();
    })

    /**
     * @tc.name   testUrlRegexRulesStatic003
     * @tc.number SUB_WEB_URLREGEXRULES_STATIC_0300
     * @tc.desc   test runJavaScriptOnDocumentEnd UrlRegexRules ok
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUrlRegexRulesStatic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: ()=> void):Promise<void> => {
        Utils.emitEvent('testUrlRegexRules003', 251224)
        Utils.registerBaseEvent('testUrlRegexRules003', 'scriptDOMEnd:http urlRegexRules ok', 25122403, done,
          (backData: events_emitter.EventData, expected: Object) => {
            const data = backData?.data as Record<string, RecordData>;
            const action = data['ACTION'];
            console.info(`Begin to assert [` + action + `] Equal [` + expected + `]`);
            expect(action).assertEqual(expected);
          });
        inspector.sendEventByKey('UrlRegexRules', 10, '');
        await Utils.msSleep(7000);
        done();
    })

    /**
     * @tc.name   testUrlRegexRulesStatic004
     * @tc.number SUB_WEB_URLREGEXRULES_STATIC_0400
     * @tc.desc   test UrlRegexRules empty no match
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUrlRegexRulesStatic004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: ()=> void):Promise<void> => {
        Utils.emitEvent('testUrlRegexRules004', 251224)
        Utils.registerBaseEvent('testUrlRegexRules004', 'no match', 25122404, done,
          (backData: events_emitter.EventData, expected: Object) => {
            const data = backData?.data as Record<string, RecordData>;
            const action = data['ACTION'];
            console.info(`Begin to assert [` + action + `] Equal [` + expected + `]`);
            expect(action).assertEqual(expected);
          });
        inspector.sendEventByKey('UrlRegexRules', 10, '');
        await Utils.msSleep(7000);
        done();
    })

    /**
     * @tc.name   testUrlRegexRulesStatic005
     * @tc.number SUB_WEB_URLREGEXRULES_STATIC_0500
     * @tc.desc   test UrlRegexRules secondLevelDomain empty no match
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUrlRegexRulesStatic005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: ()=> void):Promise<void> => {
        Utils.emitEvent('testUrlRegexRules005', 251224)
        Utils.registerBaseEvent('testUrlRegexRules005', 'no match', 25122405, done,
          (backData: events_emitter.EventData, expected: Object) => {
            const data = backData?.data as Record<string, RecordData>;
            const action = data['ACTION'];
            console.info(`Begin to assert [` + action + `] Equal [` + expected + `]`);
            expect(action).assertEqual(expected);
          });
        inspector.sendEventByKey('UrlRegexRules', 10, '');
        await Utils.msSleep(7000);
        done();
    })

    /**
     * @tc.name   testUrlRegexRulesStatic006
     * @tc.number SUB_WEB_URLREGEXRULES_STATIC_0600
     * @tc.desc   test UrlRegexRules rule empty no match
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUrlRegexRulesStatic006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: ()=> void):Promise<void> => {
        Utils.emitEvent('testUrlRegexRules006', 251224)
        Utils.registerBaseEvent('testUrlRegexRules006', 'no match', 25122406, done,
          (backData: events_emitter.EventData, expected: Object) => {
            const data = backData?.data as Record<string, RecordData>;
            const action = data['ACTION'];
            console.info(`Begin to assert [` + action + `] Equal [` + expected + `]`);
            expect(action).assertEqual(expected);
          });
        inspector.sendEventByKey('UrlRegexRules', 10, '');
        await Utils.msSleep(7000);
        done();
    })

    /**
     * @tc.name   testUrlRegexRulesStatic007
     * @tc.number SUB_WEB_URLREGEXRULES_STATIC_0700
     * @tc.desc   test UrlRegexRules secondLevelDomain rule empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUrlRegexRulesStatic007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: ()=> void):Promise<void> => {
        Utils.emitEvent('testUrlRegexRules007', 251224)
        Utils.registerBaseEvent('testUrlRegexRules0067', 'no match', 25122407, done,
          (backData: events_emitter.EventData, expected: Object) => {
            const data = backData?.data as Record<string, RecordData>;
            const action = data['ACTION'];
            console.info(`Begin to assert [` + action + `] Equal [` + expected + `]`);
            expect(action).assertEqual(expected);
          });
        inspector.sendEventByKey('UrlRegexRules', 10, '');
        await Utils.msSleep(7000);
        done();
    })

  })
}

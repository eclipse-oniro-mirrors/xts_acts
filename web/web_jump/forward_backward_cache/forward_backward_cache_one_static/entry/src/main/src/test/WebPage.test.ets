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

import { beforeAll, beforeEach, afterEach, describe, it, TestType, Size, Level, expect } from '../../../hypium/index';
import Utils from '../../src/test/Util.test';
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import emitter from '@ohos.events.emitter';

let testAbilityContext:common.UIAbilityContext;
let emitKey = ''


export default function WebPageTest() {
  describe('WebPageTest', (): void => {
    beforeAll(async (): Promise<void> => {
      console.log('App start')
    });
    beforeEach(async () => {
      await Utils.msSleep(2000);
      console.info('web beforeEach start');
    })


    /**
     * @tc.name   emitDatabaseAccessTrueStatic
     * @tc.number SUB_WEB_SecurityLevel_161000
     * @tc.desc   test SecurityLevel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitDatabaseAccessTrueStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('emitDatabaseAccessTrue', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('emitDatabaseAccessTrue', '"openDatabase"', 161000, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('web', 10, '');
        await Utils.msSleep(2000);
        done()
      })

    /**
     * @tc.name   emitDatabaseAccessFalseStatic
     * @tc.number SUB_WEB_SecurityLevel_161001
     * @tc.desc   test SecurityLevel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitDatabaseAccessFalseStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('emitDatabaseAccessFalse', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('emitDatabaseAccessFalse', '"openDatabase"', 161001, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('web', 10, '');
        await Utils.msSleep(2000);
        done()
      })

    /**
     * @tc.name   emitEnableNativeEmbedModeTrueStatic
     * @tc.number SUB_WEB_SecurityLevel_161002
     * @tc.desc   test SecurityLevel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitEnableNativeEmbedModeTrueStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('emitEnableNativeEmbedModeTrue', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('emitEnableNativeEmbedModeTrue', true, 161002, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('web', 10, '');
        await Utils.msSleep(2000);
        done()
      })

    /**
     * @tc.name   emitEnableNativeEmbedModeFalseStatic
     * @tc.number SUB_WEB_SecurityLevel_161003
     * @tc.desc   test SecurityLevel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitEnableNativeEmbedModeFalseStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('emitEnableNativeEmbedModeFalse', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('emitEnableNativeEmbedModeFalse', true, 161003, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('web', 10, '');
        await Utils.msSleep(2000);
        done()
      })

    /**
     * @tc.name   emitCopyOptionsStatic001
     * @tc.number SUB_WEB_SecurityLevel_161004
     * @tc.desc   test SecurityLevel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitCopyOptionsStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('emitCopyOptions1', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('emitCopyOptions1', true, 161004, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('web', 10, '');
        await Utils.msSleep(2000);
        done()
      })

    /**
     * @tc.name   emitCopyOptionsStatic002
     * @tc.number SUB_WEB_SecurityLevel_161005
     * @tc.desc   test SecurityLevel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitCopyOptionsStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('emitCopyOptions2', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('emitCopyOptions2', true, 161005, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('web', 10, '');
        await Utils.msSleep(2000);
        done()
      })

    /**
     * @tc.name   emitCopyOptionsStatic003
     * @tc.number SUB_WEB_SecurityLevel_161006
     * @tc.desc   test SecurityLevel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitCopyOptionsStatic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('emitCopyOptions3', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('emitCopyOptions3', true, 161006, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('web', 10, '');
        await Utils.msSleep(2000);
        done()
      })

    /**
     * @tc.name   emitHorizontalScrollBarAccessTrueStatic
     * @tc.number SUB_WEB_SecurityLevel_161007
     * @tc.desc   test SecurityLevel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitHorizontalScrollBarAccessTrueStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('emitHorizontalScrollBarAccessTrue', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('emitHorizontalScrollBarAccessTrue', true, 161007, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('web', 10, '');
        await Utils.msSleep(2000);
        done()
      })

    /**
     * @tc.name   emitHorizontalScrollBarAccessFalseStatic
     * @tc.number SUB_WEB_SecurityLevel_161008
     * @tc.desc   test SecurityLevel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitHorizontalScrollBarAccessFalseStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('emitHorizontalScrollBarAccessFalse', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('emitHorizontalScrollBarAccessFalse', true, 161008, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('web', 10, '');
        await Utils.msSleep(2000);
        done()
      })

    /**
     * @tc.name   emitEnableImageAnalyzerStatic001
     * @tc.number SUB_WEB_SecurityLevel_20230121
     * @tc.desc   test SecurityLevel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitEnableImageAnalyzerStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('emitEnableImageAnalyzer01', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('emitEnableImageAnalyzer01', true, 20230121, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('web', 10, '');
        await Utils.msSleep(2000);
        done()
      })

    /**
     * @tc.name   emitEnableImageAnalyzerStatic002
     * @tc.number SUB_WEB_SecurityLevel_20230122
     * @tc.desc   test SecurityLevel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitEnableImageAnalyzerStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('emitEnableImageAnalyzer02', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('emitEnableImageAnalyzer02', true, 20230122, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('web', 10, '');
        await Utils.msSleep(2000);
        done()
      })


    /**
     * @tc.name   emitEnableImageAnalyzerStatic003
     * @tc.number SUB_WEB_SecurityLevel_20230123
     * @tc.desc   test SecurityLevel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitEnableImageAnalyzerStatic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('emitEnableImageAnalyzer03', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('emitEnableImageAnalyzer03', true, 20230123, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('web', 10, '');
        await Utils.msSleep(2000);
        done()
      })

    /**
     * @tc.name   emitVerticalScrollBarAccessTrueStatic
     * @tc.number SUB_WEB_SecurityLevel_20230124
     * @tc.desc   test SecurityLevel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitVerticalScrollBarAccessTrueStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('emitVerticalScrollBarAccessTrue', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('emitVerticalScrollBarAccessTrue', true, 20230124, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('web', 10, '');
        await Utils.msSleep(2000);
        done()
      })


    /**
     * @tc.name   emitVerticalScrollBarAccessFalseStatic
     * @tc.number SUB_WEB_SecurityLevel_20230125
     * @tc.desc   test SecurityLevel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitVerticalScrollBarAccessFalseStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('emitVerticalScrollBarAccessFalse', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('emitVerticalScrollBarAccessFalse', true, 20230125, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('web', 10, '');
        await Utils.msSleep(2000);
        done()
      })

    /**
     * @tc.name   emitJavaScriptAccessTrueStatic
     * @tc.number SUB_WEB_SecurityLevel_20230126
     * @tc.desc   test SecurityLevel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitJavaScriptAccessTrueStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('emitJavaScriptAccessTrue', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('emitJavaScriptAccessTrue', true, 20230126, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('web', 10, '');
        await Utils.msSleep(2000);
        done()
      })


    /**
     * @tc.name   emitJavaScriptAccessFalseStatic
     * @tc.number SUB_WEB_SecurityLevel_20230127
     * @tc.desc   test SecurityLevel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitJavaScriptAccessFalseStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('emitJavaScriptAccessFalse', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('emitJavaScriptAccessFalse', true, 20230127, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('web', 10, '');
        await Utils.msSleep(2000);
        done()
      })

    /**
     * @tc.name   emitLayoutModeStatic001
     * @tc.number SUB_WEB_SecurityLevel_202301271
     * @tc.desc   test SecurityLevel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitLayoutModeStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('emitLayoutMode01', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('emitLayoutMode01', true, 202301271, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('web', 10, '');
        await Utils.msSleep(2000);
        done()
      })

    /**
     * @tc.name   emitLayoutModeStatic002
     * @tc.number SUB_WEB_SecurityLevel_202301272
     * @tc.desc   test SecurityLevel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitLayoutModeStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('emitLayoutMode02', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('emitLayoutMode02', true, 202301272, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('web', 10, '');
        await Utils.msSleep(2000);
        done()
      })

    /**
     * @tc.name   emitLayoutModeStatic003
     * @tc.number SUB_WEB_SecurityLevel_202301273
     * @tc.desc   test SecurityLevel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitLayoutModeStatic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('emitLayoutMode03', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('emitLayoutMode03', true, 202301273, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('web', 10, '');
        await Utils.msSleep(2000);
        done()
      })


    /**
     * @tc.name   enableWebAVSessionStatic001
     * @tc.number SUB_WEB_SecurityLevel_20230130
     * @tc.desc   test SecurityLevel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('enableWebAVSessionStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('enableWebAVSession01', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('enableWebAVSession01', true, 20230130, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('web', 10, '');
        await Utils.msSleep(2000);
        done()
      })

    /**
     * @tc.name   enableWebAVSessionStatic002
     * @tc.number SUB_WEB_SecurityLevel_20230131
     * @tc.desc   test SecurityLevel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('enableWebAVSessionStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('enableWebAVSession02', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('enableWebAVSession02', true, 20230131, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('web', 10, '');
        await Utils.msSleep(2000);
        done()
      })

    /**
     * @tc.name   enableWebAVSessionStatic003
     * @tc.number SUB_WEB_SecurityLevel_20230132
     * @tc.desc   test SecurityLevel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('enableWebAVSessionStatic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('enableWebAVSession03', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('enableWebAVSession03', true, 20230132, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('web', 10, '');
        await Utils.msSleep(2000);
        done()
      })

    /**
     * @tc.name   fileAccessStatic001
     * @tc.number SUB_WEB_SecurityLevel_20230133
     * @tc.desc   test SecurityLevel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileAccessStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('fileAccess01', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('fileAccess01', true, 20230133, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('web', 10, '');
        await Utils.msSleep(2000);
        done()
      })

    /**
     * @tc.name   fileAccessStatic002
     * @tc.number SUB_WEB_SecurityLevel_20230134
     * @tc.desc   test SecurityLevel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileAccessStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('fileAccess02', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('fileAccess02', true, 20230134, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('web', 10, '');
        await Utils.msSleep(2000);
        done()
      })

    /**
     * @tc.name   fileAccessStatic003
     * @tc.number SUB_WEB_SecurityLevel_20230135
     * @tc.desc   test SecurityLevel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileAccessStatic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('fileAccess03', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('fileAccess03', true, 20230135, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('web', 10, '');
        await Utils.msSleep(2000);
        done()
      })

    /**
     * @tc.name   forceDisplayScrollBarStatic001
     * @tc.number SUB_WEB_SecurityLevel_20230136
     * @tc.desc   test SecurityLevel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('forceDisplayScrollBarStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('forceDisplayScrollBar01', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('forceDisplayScrollBar01', true, 20230136, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('web', 10, '');
        await Utils.msSleep(2000);
        done()
      })

    /**
     * @tc.name   forceDisplayScrollBarStatic002
     * @tc.number SUB_WEB_SecurityLevel_20230137
     * @tc.desc   test SecurityLevel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('forceDisplayScrollBarStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('forceDisplayScrollBar02', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('forceDisplayScrollBar02', true, 20230137, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('web', 10, '');
        await Utils.msSleep(2000);
        done()
      })

    /**
     * @tc.name   forceDisplayScrollBarStatic003
     * @tc.number SUB_WEB_SecurityLevel_20230138
     * @tc.desc   test SecurityLevel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('forceDisplayScrollBarStatic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('forceDisplayScrollBar03', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('forceDisplayScrollBar03', true, 20230138, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('web', 10, '');
        await Utils.msSleep(2000);
        done()
      })

    /**
    * @tc.name        emitOnSwitchNextPageStatic
    * @tc.number      SUB_WEB_WEBHTTPBODYSTREAM_20029
    * @tc.desc        change page
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('emitOnSwitchNextPageStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('emitonSwitchNextPage', 10)
        await Utils.msSleep(2000);
        inspector.sendEventByKey('web', 10, '');
        await Utils.msSleep(2000);
        done();
      })
  })
}

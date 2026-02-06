'use static'

/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level, beforeAll, afterAll } from '../../../hypium/index';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import Utils from './Util.test';

import inspector from '@ohos.arkui.inspector';
import { ContextMenuMediaType, ContextMenuInputFieldType, ContextMenuSourceType } from '@ohos.arkui.component'

let domain: Int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let testAbilityContext: common.UIAbilityContext;

export default function webInitTest() {

  describe('webInitTest', (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');
    beforeAll(() => {
      await Utils.sleep(2000)
      await Utils.emitEvent('pages/WebInitTest', 10)
      await Utils.sleep(2000)
      inspector.sendEventByKey('Router', 10, '');
      await Utils.sleep(2000)
      hilog.info(domain, tag, '%{public}s', 'beforeAll end');
    })

    /**
     * @tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_033
     * @tc.name ContextMenuMediaTypeStatic
     * @tc.desc Save current page
     */
    it('ContextMenuMediaTypeStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      Utils.emitEvent('emitContextMenuMediaType', 10)
      await Utils.sleep(2000);
      Utils.registerEvent('ContextMenuMediaType', ContextMenuMediaType.NONE, 333, done);
      Utils.registerEvent('ContextMenuMediaType', ContextMenuMediaType.IMAGE, 33, done);
      inspector.sendEventByKey('WebInitTestButton', 10, '');
      await Utils.sleep(3000)
      done()
    })

    /**
     * @tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_034
     * @tc.name ContextMenuInputFieldTypeStatic
     * @tc.desc Save current page
     */
    it('ContextMenuInputFieldTypeStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      Utils.emitEvent('emitContextMenuInputFieldType', 10)
      await Utils.sleep(2000);
      Utils.registerEvent('ContextMenuInputFieldType', ContextMenuInputFieldType.NONE, 344, done);
      Utils.registerEvent('ContextMenuInputFieldType', ContextMenuInputFieldType.PLAIN_TEXT, 34, done);
      Utils.registerEvent('ContextMenuInputFieldType', ContextMenuInputFieldType.PASSWORD, 355, done);
      Utils.registerEvent('ContextMenuInputFieldType', ContextMenuInputFieldType.TELEPHONE, 35, done);
      Utils.registerEvent('ContextMenuInputFieldType', ContextMenuInputFieldType.NUMBER_DATA, 366, done);
      Utils.registerEvent('ContextMenuInputFieldType', ContextMenuInputFieldType.OTHER, 36, done);
      inspector.sendEventByKey('WebInitTestButton', 10, '');
      await Utils.sleep(3000)
      done()
    })

    /**
     * @tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_035
     * @tc.name ContextMenuSourceTypeStatic
     * @tc.desc Save current page
     */
    it('ContextMenuSourceTypeStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      Utils.emitEvent('ContextMenuSourceType', 10)
      await Utils.sleep(2000);
      Utils.registerEvent('ContextMenuSourceType', ContextMenuSourceType.NONE, 37, done);
      Utils.registerEvent('ContextMenuSourceType', ContextMenuSourceType.MOUSE, 38, done);
      Utils.registerEvent('ContextMenuSourceType', ContextMenuSourceType.LONG_PRESS, 39, done);
      inspector.sendEventByKey('WebInitTestButton', 10, '');
      await Utils.sleep(3000)
      done()
    })

    /**
     * @tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_014
     * @tc.name requestFocusStatic
     * @tc.desc Gets the request focus
     */
    it('requestFocusStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      Utils.emitEvent('emitGetRequestFocus', 10)
      await Utils.sleep(2000);
      Utils.registerEvent('requestFocus', 'requestFocus', 126, done);
      inspector.sendEventByKey('WebInitTestButton', 10, '');
      await Utils.sleep(3000)
      done()
    })

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_1100
     * @tc.name testScrollableElevenStatic
     * @tc.desc When the scrollTo interface is called, the y input parameter is a positive number and the x input
     * @parameter is a positive number, both of which are greater than the page width and height
     */
    it('testScrollableElevenStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      Utils.emitEvent('testScrollableEleven', 10)
      await Utils.sleep(2000);
      Utils.registerEvent('testScrollableEleven', false, 234234, done);
      inspector.sendEventByKey('WebInitTestButton', 10, '');
      await Utils.sleep(3000)
      done()
    })

    /**
     * @tc.number       SUB_WEB_JSRESULT_HANDLECANCEL_0100
     * @tc.name         testJsResultHandleCancelStatic001
     * @tc.desc         test JsResultHandle.cancel()
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testJsResultHandleCancelStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      Utils.emitEvent('emitJsResultHandleCancel001', 10)
      await Utils.sleep(1000);
      Utils.registerEvent('testJsResultHandleCancel001', 'false', 70021, done);
      inspector.sendEventByKey('WebInitTestButton', 10, '');
      await Utils.sleep(3000)
      done()
    })

    /**
     * @tc.number       SUB_WEB_JSRESULT_HANDLECONFIRM_0100
     * @tc.name         testJsResultHandleConfirmStatic001
     * @tc.desc         test JsResultHandle.confirm()
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testJsResultHandleConfirmStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      Utils.emitEvent('emitJsResultHandleConfirm001', 10)
      await Utils.sleep(1000);
      Utils.registerEvent('testJsResultHandleConfirm001', 'true', 70023, done);
      inspector.sendEventByKey('WebInitTestButton', 10, '');
      await Utils.sleep(3000)
      done()
    })

    /**
     * @tc.number       SUB_WEB_JSRESULT_HANDLEPROMPTCONFIRM_0100
     * @tc.name         testJsResultHandlePromptConfirmStatic001
     * @tc.desc         test JsResultHandle.promptConfirm()
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testJsResultHandlePromptConfirmStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void) => {
        Utils.emitEvent('emitJsResultHandlePromptConfirm001', 10)
        await Utils.sleep(1000);
        Utils.registerEvent('testJsResultHandlePromptConfirm001', '"handlePromptConfirm"', 70025, done);
        inspector.sendEventByKey('WebInitTestButton', 10, '');
        await Utils.sleep(3000)
        done()
      })

    afterAll(() => {
      hilog.info(domain, tag, '%{public}s', 'afterAll start');
      Utils.emitEvent('back', 10)
      await Utils.sleep(2000);
      inspector.sendEventByKey('WebInitTestButton', 10, '');
    })
  })

}

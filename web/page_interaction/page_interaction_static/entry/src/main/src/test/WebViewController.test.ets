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
import { Driver, ON } from '@ohos.UiTest';

import inspector from '@ohos.arkui.inspector';
import { FileSelectorMode } from '@ohos.arkui.component'

let domain: Int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let testAbilityContext: common.UIAbilityContext;
const driver = Driver.create();

export default function webViewController() {

  describe('WebViewController', (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');
    beforeAll(async (): Promise<void> => {
      await Utils.sleep(2000)
      await Utils.emitEvent('pages/webViewController', 10)
      await Utils.sleep(2000)
      inspector.sendEventByKey('Router', 10, '');
      await Utils.sleep(2000)
      hilog.info(domain, tag, '%{public}s', 'beforeAll end');
    })

    /**
     * @tc.name        testOnShowFileSelectorStatic001
     * @tc.number      SUB_WEB_ONSHOWFILESELECTOR_0100
     * @tc.desc        test onShowFileSelector
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       LEVEL0
     */
    it('testOnShowFileSelectorStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testOnShowFileSelector001', 10)
        await Utils.sleep(2000);
        Utils.registerEvent('testOnShowFileSelector001', true, 31029, done);
        inspector.sendEventByKey('WebViewControllerButton', 10, '');
        await Utils.sleep(3000)
        done()
      })

    /**
     * @tc.name        testFileSelectorResultStatic
     * @tc.number      SUB_WEB_FILESELECTORESULT_0100
     * @tc.desc        test onShowFileSelector
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       LEVEL0
     */
    it('testFileSelectorResultStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testFileSelectorResult', 10)
        await Utils.sleep(2000);
        Utils.registerEvent('testFileSelectorResult', true, 310291, done);
        inspector.sendEventByKey('WebViewControllerButton', 10, '');
        await Utils.sleep(3000)
        done()
      })

    /**
     * @tc.name        testFileSelectorParamStatic
     * @tc.number      SUB_WEB_FILESELECTORPARAM_0100
     * @tc.desc        test onShowFileSelector
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       LEVEL0
     */
    it('testFileSelectorParamStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testFileSelectorParam', 10)
        await Utils.sleep(2000);
        Utils.registerEvent('testFileSelectorParam', true, 310292, done);
        inspector.sendEventByKey('WebViewControllerButton', 10, '');
        await Utils.sleep(3000)
        done()
      })

    /**
     * @tc.name        testOnShowFileSelectorUndefinedStatic
     * @tc.number      SUB_WEB_FILESELECTORPARAM_0200
     * @tc.desc        test onShowFileSelector
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       LEVEL0
     */
    it('testOnShowFileSelectorUndefinedStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testOnShowFileSelectorUndefined', 10)
        await Utils.sleep(2000);
        Utils.registerEvent('testOnShowFileSelectorUndefined', true, 310293, done);
        inspector.sendEventByKey('WebViewControllerButton', 10, '');
        await Utils.sleep(3000)
        done()
      })

    /**
     * @tc.name        testFileSelectorParamGetTitleStatic001
     * @tc.number      SUB_WEB_FILESELECTORPARAM_GETTITLE_0100
     * @tc.desc        test FileSelectorParam getTitle
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       LEVEL0
     */
    it('testFileSelectorParamGetTitleStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testFileSelectorParamGetTitle001', 10)
        await Utils.sleep(2000);
        Utils.registerEvent('testFileSelectorParamGetTitle001', 'open file', 31030, done);
        inspector.sendEventByKey('WebViewControllerButton', 10, '');
        await Utils.sleep(3000)
        done()
      })

    /**
     * @tc.name        testFileSelectorParamGetModeStatic001
     * @tc.number      SUB_WEB_FILESELECTORPARAM_GETMODE_0100
     * @tc.desc        test FileSelectorParam getMode
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       LEVEL0
     */
    it('testFileSelectorParamGetModeStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testFileSelectorParamGetMode001', 10)
        await Utils.sleep(2000);
        Utils.registerEvent('testFileSelectorParamGetMode001', 0, 31031, done);
        Utils.registerEvent('testFileSelectorParamGetMode001', FileSelectorMode.FILE_OPEN_MODE, 310311, done);
        Utils.registerEvent('testFileSelectorParamGetMode001', FileSelectorMode.FILE_OPEN_MULTIPLE_MODE, 310312, done);
        Utils.registerEvent('testFileSelectorParamGetMode001', FileSelectorMode.FILE_OPEN_FOLDER_MODE, 310313, done);
        Utils.registerEvent('testFileSelectorParamGetMode001', FileSelectorMode.FILE_SAVE_MODE, 310314, done);
        inspector.sendEventByKey('WebViewControllerButton', 10, '');
        await Utils.sleep(3000)
        done()
      })

    /**
     * @tc.name        testFileSelectorParamGetAcceptTypeStatic001
     * @tc.number      SUB_WEB_FILESELECTORPARAM_GETACCEPTTYPE_0100
     * @tc.desc        test FileSelectorParam getAcceptType
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       LEVEL0
     */
    it('testFileSelectorParamGetAcceptTypeStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testFileSelectorParamGetAcceptType001', 10)
        await Utils.sleep(2000);
        Utils.registerEvent('testFileSelectorParamGetAcceptType001', '.json', 31032, done);
        inspector.sendEventByKey('WebViewControllerButton', 10, '');
        await Utils.sleep(3000)
        done()
      })

    /**
     * @tc.name        testFileSelectorParamIsCaptureStatic001
     * @tc.number      SUB_WEB_FILESELECTORPARAM_ISCAPTURE_31033
     * @tc.desc        test FileSelectorParam isCapture
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       LEVEL0
     */
    it('testFileSelectorParamIsCaptureStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testFileSelectorParamIsCapture001', 10)
        await Utils.sleep(2000);
        Utils.registerEvent('testFileSelectorParamIsCapture001', false, 31033, done);
        inspector.sendEventByKey('WebViewControllerButton', 10, '');
        await Utils.sleep(3000)
        done()
      })

    /**
     * @tc.name        testFileSelectorResultHandleFileListStatic001
     * @tc.number      SUB_WEB_FILESELECTORRESULT_HANDLEFILELIST_31034
     * @tc.desc        test FileSelectorResult handleFileList
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       LEVEL0
     */
    it('testFileSelectorResultHandleFileListStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testFileSelectorResultHandleFileList001', 10)
        await Utils.sleep(2000);
        Utils.registerEvent('testFileSelectorResultHandleFileList001', '"1.json"', 31034, done);
        inspector.sendEventByKey('WebViewControllerButton', 10, '');
        await Utils.sleep(3000)
        done()
      })

    /**
     * @tc.name        testFileSelectorParamGetMimeTypesStatic001
     * @tc.number      SUB_WEB_FILESELECTORPARAM_GETMIMETYPES_31035
     * @tc.desc        test FileSelectorParam getMimeTypes
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       LEVEL0
     */
    it('testFileSelectorParamGetMimeTypesStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testFileSelectorParamGetMimeTypes001', 10)
        await Utils.sleep(2000);
        Utils.registerEvent('testFileSelectorParamGetMimeTypes001', '.json', 31035, done);
        inspector.sendEventByKey('WebViewControllerButton', 10, '');
        await Utils.sleep(3000)
        done()
      })

    /**
     * @tc.name        testFileSelectorParamGetSuggestedNameStatic001
     * @tc.number      SUB_WEB_FILESELECTORPARAM_GETSUGGESTEDNAME_0100
     * @tc.desc        test FileSelectorParam getSuggestedName
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       LEVEL0
     */
    it('testFileSelectorParamGetSuggestedNameStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testFileSelectorParamGetSuggestedName001', 10)
        await Utils.sleep(2000);
        Utils.registerEvent('testFileSelectorParamGetSuggestedName001', 'Documents', 31036, done);
        inspector.sendEventByKey('WebViewControllerButton', 10, '');
        await Utils.sleep(3000)
        done()
      })

    /**
     * @tc.name        testFileSelectorParamGetDefaultPathStatic001
     * @tc.number      SUB_WEB_FILESELECTORPARAM_GETDEFAULTPATH_0100
     * @tc.desc        test FileSelectorParam getDefaultPath
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       LEVEL0
     */
    it('testFileSelectorParamGetDefaultPathStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testFileSelectorParamGetDefaultPath001', 10)
        await Utils.sleep(2000);
        Utils.registerEvent('testFileSelectorParamGetDefaultPath001', '/storage/Users/currentUser/', 31037, done);
        inspector.sendEventByKey('WebViewControllerButton', 10, '');
        await Utils.sleep(3000)
        done()
      })

    /**
     * @tc.name        testOnShowFileSelectorStatic05
     * @tc.number      SUB_WEB_FILESELECTORPARAM_GETMIMETYPES_0500
     * @tc.desc        test FileSelectorParam getMimeTypes
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       LEVEL0
     */
    it('testOnShowFileSelectorStatic05', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let buttonOne = await driver.findComponent(ON.text('保存文件'));
        if(buttonOne)
        {
          await buttonOne.click();
          console.log("✅ 成功点击「保存文件」按钮");
        }
        let buttonTwo = await driver.findComponent(ON.text('重置内容'));
        if (buttonTwo) {
          await buttonTwo.click()
        } else {
          let buttonThree = await driver.findComponent(ON.text('取消'));
          if (buttonThree) {
            await buttonThree.click()
          }

        }
        Utils.emitEvent('emitOnShowFileSelector05', 10)
        await Utils.sleep(2000);
        Utils.registerEvent('emitOnShowFileSelector05', 'video/*', 20260109, done);
        inspector.sendEventByKey('WebViewControllerButton', 10, '');
        await Utils.sleep(3000)
        done()
      })

    /**
     * @tc.name        testFileSelectorParamGetDescriptionsStatic001
     * @tc.number      SUB_WEB_FILESELECTORPARAM_GETDESCRIPTIONS_0100
     * @tc.desc        test FileSelectorParam getDescriptions
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       LEVEL0
     */
    it('testFileSelectorParamGetDescriptionsStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testFileSelectorParamGetDescriptions001', 10)
        await Utils.sleep(2000);
        Utils.registerEvent('testFileSelectorParamGetDescriptions001', 1, 31038, done);
        inspector.sendEventByKey('WebViewControllerButton', 10, '');
        await Utils.sleep(3000)
        done()
      })

    /**
     * @tc.name        testFileSelectorParamIsAcceptAllOptionExcludedStatic001
     * @tc.number      SUB_WEB_FILESELECTORPARAM_ISACCEPTALLOPTIONEXCLUDED_0100
     * @tc.desc        test FileSelectorParam isAcceptAllOptionExcluded
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       LEVEL0
     */
    it('testFileSelectorParamIsAcceptAllOptionExcludedStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testFileSelectorParamIsAcceptAllOptionExcluded001', 10)
        await Utils.sleep(2000);
        Utils.registerEvent('testFileSelectorParamIsAcceptAllOptionExcluded001', false, 31039, done);
        inspector.sendEventByKey('WebViewControllerButton', 10, '');
        await Utils.sleep(3000)
        done()
      })

    /**
     * @tc.name        testFileSelectorParamGetAcceptableFileTypesStatic001
     * @tc.number      SUB_WEB_FILESELECTORPARAM_GETACCEPTABLEFILETYPES_0100
     * @tc.desc        test FileSelectorParam getAcceptableFileTypes
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       LEVEL0
     */
    it('testFileSelectorParamGetAcceptableFileTypesStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testFileSelectorParamGetAcceptableFileTypes001', 10)
        await Utils.sleep(2000);
        Utils.registerEvent('testFileSelectorParamGetAcceptableFileTypes001', 0, 31040, done);
        inspector.sendEventByKey('WebViewControllerButton', 10, '');
        await Utils.sleep(3000)
        done()
      })

    /**
     * @tc.name        testOnShowFileSelectorStatic06
     * @tc.number      SUB_WEB_FILESELECTORPARAM_GETMIMETYPES_0600
     * @tc.desc        test FileSelectorParam getMimeTypes
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       LEVEL0
     */
    it('testOnShowFileSelectorStatic06', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let buttonOne = await driver.findComponent(ON.text('保存文件'));
        if(buttonOne)
        {
          await buttonOne.click();
          console.log("✅ 成功点击「保存文件」按钮");
        }
        let buttonTwo = await driver.findComponent(ON.text('重置内容'));
        if (buttonTwo) {
          await buttonTwo.click()
        } else {
          let buttonThree = await driver.findComponent(ON.text('取消'));
          if (buttonThree) {
            await buttonThree.click()
          }

        }
        Utils.emitEvent('emitOnShowFileSelector06', 10)
        await Utils.sleep(2000);
        Utils.registerEvent('emitOnShowFileSelector06', '[".mp4",".ogm",".wmv",".mpg"]', 20260110, done);
        inspector.sendEventByKey('WebViewControllerButton', 10, '');
        await Utils.sleep(3000)
        done()
      })

    afterAll(async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'afterAll start');
      Utils.emitEvent('back', 10)
      await Utils.sleep(2000);
      inspector.sendEventByKey('WebViewControllerButton', 10, '');
    })
  })
}

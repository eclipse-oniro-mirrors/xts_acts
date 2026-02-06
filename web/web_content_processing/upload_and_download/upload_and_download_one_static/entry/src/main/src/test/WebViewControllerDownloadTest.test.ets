/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { Level, Size, TestType, beforeAll, beforeEach, describe, it, afterEach, expect } from '../../../hypium/index';
import router from '@ohos.router';
import Utils from './Utils.test';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import{BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import inspector from '@ohos.arkui.inspector';
import webview from '@ohos.web.webview';
import wifiMg from '@ohos.wifiManager';

let testAbilityContext:common.UIAbilityContext;

export default function webViewControllerDownloadTest() {
  describe('WebViewControllerDownloadTest', () => {
    beforeAll(async (): Promise<void> => {
      console.log("App start")
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      abilityDelegator.addAbilityMonitor({
        abilityName: "EntryAbility",
        moduleName: "entry",
        onAbilityCreate: (abilitys: UIAbility): void=> {
          testAbilityContext = abilitys.context
          console.log("onAbilityCreate end")
        },
      }, (err: BusinessError<void> | null): void => {
        if (err != null) {
          console.log("-----" + err.code)
        }
        console.log("BusinessError  end")
      });
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.open.harmony.uploadanddownloadonetest.static")
      await Utils.msSleep(2000)
      console.log("beforeAll end,%s", "Succeed!")
    });

    beforeEach(async () => {
      try {
        let data: wifiMg.WifiLinkedInfo = await wifiMg.getLinkedInfo();
        console.info('======> wifi_test/isWifiActive :' + wifiMg.isWifiActive());
        console.info('======> Internet WifiLinkedInfo : ' + JSON.stringify(data));
        console.info('======> Internet speed : ' + JSON.stringify(data.linkSpeed));
        console.info('======> Internet chload : ' + JSON.stringify(data.chload));
        console.info('======> Internet rssi : ' + JSON.stringify(data.rssi));
        if (data.connState == wifiMg.ConnState.CONNECTED) {
          console.info('======> WLAN connection established ');
        } else {
          expect().message('======> WLAN Network error').assertFail();
        }
        if (data.chload >= 900 || data.rssi <= -80) {
          expect().message('======> WLAN Network error').assertFail();
        } else if (data.chload >= 500) {
          console.info('======> The internet connection is poor. ');
        }
      } catch (err) {
        console.info('======> getLinkedInfo promise failed, err : ', err);
        throw (err as Error);
      }
    })

    /**
     * @tc.name   testSetDownloadDelegateGroup001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SETDOWNLOADDELEGATE_GROUP_0100
     * @tc.desc   test setDownloadDelegate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetDownloadDelegateGroup001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent("testSetDownloadDelegate001", 10);
      await Utils.msSleep(2000);
      Utils.registerEvent("testSetDownloadDelegate001", true, 79520, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testStartDownloadGroup001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_STARTDOWNLOAD_GROUP_0100
     * @tc.desc   test startDownload
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testStartDownloadGroup001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent("testStartDownload001", 10);
      await Utils.msSleep(2000);
      Utils.registerEvent("testStartDownload001", true, 79530, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testWebDownloadStateGroup001
     * @tc.number SUB_WEB_WEBDOWNLOADSTATE_GROUP_0100
     * @tc.desc   test WebDownloadState.IN_PROGRESS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebDownloadStateGroup001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> =>  {
      await Utils.msSleep(2000);
      Utils.emitEvent("testWebDownloadState001", 10);
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebDownloadState001", webview.WebDownloadState.IN_PROGRESS, 79540, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testWebDownloadStateGroup002
     * @tc.number SUB_WEB_WEBDOWNLOADSTATE_GROUP_0200
     * @tc.desc   test WebDownloadState.COMPLETED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebDownloadStateGroup002',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> =>  {
      await Utils.msSleep(2000);
      Utils.emitEvent("testWebDownloadState002", 10);
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebDownloadState002", webview.WebDownloadState.COMPLETED, 79542, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testWebDownloadStateGroup003
     * @tc.number SUB_WEB_WEBDOWNLOADSTATE_GROUP_0300
     * @tc.desc   test WebDownloadState.CANCELED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebDownloadStateGroup003',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> =>  {
      await Utils.msSleep(2000);
      Utils.emitEvent("testWebDownloadState003", 10);
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebDownloadState003", webview.WebDownloadState.CANCELED, 79544, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testWebDownloadStateGroup004
     * @tc.number SUB_WEB_WEBDOWNLOADSTATE_GROUP_0400
     * @tc.desc   test WebDownloadState.INTERRUPTED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebDownloadStateGroup004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> =>  {
      await Utils.msSleep(2000);
      Utils.emitEvent("testWebDownloadState004", 10);
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebDownloadState004", webview.WebDownloadState.INTERRUPTED, 79546, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testWebDownloadStateGroup005
     * @tc.number SUB_WEB_WEBDOWNLOADSTATE_GROUP_0500
     * @tc.desc   test WebDownloadState.PENDING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebDownloadStateGroup005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> =>  {
      await Utils.msSleep(2000);
      Utils.emitEvent("testWebDownloadState005", 10);
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebDownloadState005", webview.WebDownloadState.PENDING, 79548, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testWebDownloadStateGroup006
     * @tc.number SUB_WEB_WEBDOWNLOADSTATE_GROUP_0600
     * @tc.desc   test WebDownloadState.PENDING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebDownloadStateGroup006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> =>  {
        await Utils.msSleep(2000);
        Utils.emitEvent("testWebDownloadState006", 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("testWebDownloadState006", webview.WebDownloadState.PAUSED, 79550, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
        await Utils.msSleep(2000);
        done();
    })


    /**
     * @tc.name   testGetGuidGroup001
     * @tc.number SUB_WEB_WEBDOWNLOADITEM_GETGUID_GROUP_0100
     * @tc.desc   test WebDownloadItem.getGuid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetGuidGroup001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> =>  {
      await Utils.msSleep(2000);
      Utils.emitEvent("testGetGuid001", 10);
      await Utils.msSleep(2000);
      Utils.registerEvent("testGetGuid001", true, 79650, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testGetGuidGroup002
     * @tc.number SUB_WEB_WEBDOWNLOADITEM_GETGUID_GROUP_0200
     * @tc.desc   test WebDownloadItem.getGuid when download two files
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetGuidGroup002',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> =>  {
      await Utils.msSleep(2000);
      Utils.emitEvent("testGetGuid002", 10);
      await Utils.msSleep(2000);
      Utils.registerEvent("testGetGuid002", true, 79652, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testGetCurrentSpeedGroup001
     * @tc.number SUB_WEB_WEBDOWNLOADITEM_GETCURRENTSPEED_GROUP_0100
     * @tc.desc   test WebDownloadItem.getCurrentSpeed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetCurrentSpeedGroup001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> =>  {
      await Utils.msSleep(2000);
      Utils.emitEvent("testGetCurrentSpeed001", 10);
      await Utils.msSleep(2000);
      Utils.registerEvent("testGetCurrentSpeed001", true, 79654, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testGetPercentCompleteGroup001
     * @tc.number SUB_WEB_WEBDOWNLOADITEM_GETPERCENTCOMPLETE_GROUP_0100
     * @tc.desc   test WebDownloadItem.getPercentComplete
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetPercentCompleteGroup001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> =>  {
      await Utils.msSleep(2000);
      Utils.emitEvent("testGetPercentComplete001", 10);
      await Utils.msSleep(2000);
      Utils.registerEvent("testGetPercentComplete001", true, 79656, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testGetPercentCompleteGroup002
     * @tc.number SUB_WEB_WEBDOWNLOADITEM_GETPERCENTCOMPLETE_GROUP_0200
     * @tc.desc   test WebDownloadItem.getPercentComplete when download finish
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetPercentCompleteGroup002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> =>  {
      await Utils.msSleep(2000);
      Utils.emitEvent("testGetPercentComplete002", 10);
      await Utils.msSleep(2000);
      Utils.registerEvent("testGetPercentComplete002", true, 79658, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testGetTotalBytesGroup001
     * @tc.number SUB_WEB_WEBDOWNLOADITEM_GETTOTALBYTES_GROUP_0100
     * @tc.desc   test WebDownloadItem.getTotalBytes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetTotalBytesGroup001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent("testGetTotalBytes001", 10);
      await Utils.msSleep(2000);
      Utils.registerEvent("testGetTotalBytes001", true, 79660, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testGetMethodGroup001
     * @tc.number SUB_WEB_WEBDOWNLOADITEM_GETMETHOD_GROUP_0100
     * @tc.desc   test WebDownloadItem.getMethod
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetMethodGroup001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> =>  {
      await Utils.msSleep(2000);
      Utils.emitEvent("testGetMethod001", 10);
      await Utils.msSleep(2000);
      Utils.registerEvent("testGetMethod001", true, 79662, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testGetMimeTypeGroup001
     * @tc.number SUB_WEB_WEBDOWNLOADITEM_GETMIMETYPE_GROUP_0100
     * @tc.desc   test WebDownloadItem.getMimeType image/png
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetMimeTypeGroup001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent("testGetMimeType001", 10);
      await Utils.msSleep(2000);
      Utils.registerEvent("testGetMimeType001", true, 79664, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testGetMimeTypeGroup002
     * @tc.number SUB_WEB_WEBDOWNLOADITEM_GETMIMETYPE_GROUP_0200
     * @tc.desc   test WebDownloadItem.getMimeType video/mp4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetMimeTypeGroup002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> =>  {
      await Utils.msSleep(2000);
      Utils.emitEvent("testGetMimeType002", 10);
      await Utils.msSleep(2000);
      Utils.registerEvent("testGetMimeType001", true, 79666, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testGetMimeTypeGroup003
     * @tc.number SUB_WEB_WEBDOWNLOADITEM_GETMIMETYPE_GROUP_0300
     * @tc.desc   test WebDownloadItem.getMimeType application/x-msdownload
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetMimeTypeGroup003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent("testGetMimeType003", 10);
      await Utils.msSleep(2000);
      Utils.registerEvent("testGetMimeType003", true, 79668, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testGetUrlGroup001
     * @tc.number SUB_WEB_WEBDOWNLOADITEM_GETURL_GROUP_0100
     * @tc.desc   test WebDownloadItem.getUrl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetUrlGroup001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> =>  {
      await Utils.msSleep(2000);
      Utils.emitEvent("testGetUrl001", 10);
      await Utils.msSleep(2000);
      Utils.registerEvent("testGetUrl001", true, 79670, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testGetSuggestedFileNameGroup001
     * @tc.number SUB_WEB_WEBDOWNLOADITEM_GETSUGGESTEDFILENAME_GROUP_0100
     * @tc.desc   test WebDownloadItem.getSuggestedFileName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetSuggestedFileNameGroup001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> =>  {
      await Utils.msSleep(2000);
      Utils.emitEvent("testGetSuggestedFileName001", 10);
      await Utils.msSleep(2000);
      Utils.registerEvent("testGetSuggestedFileName001", true, 79672, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testGetReceivedBytesGroup001
     * @tc.number SUB_WEB_WEBDOWNLOADITEM_GETRECEIVEDBYTES_GROUP_0100
     * @tc.desc   test WebDownloadItem.getReceivedBytes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetReceivedBytesGroup001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> =>  {
      await Utils.msSleep(2000);
      Utils.emitEvent("testGetReceivedBytes001", 10);
      await Utils.msSleep(2000);
      Utils.registerEvent("testGetReceivedBytes001", true, 79674, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testGetFullPathGroup001
     * @tc.number SUB_WEB_WEBDOWNLOADITEM_GETFULLPATH_GROUP_0100
     * @tc.desc   test WebDownloadItem.getFullPath
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetFullPathGroup001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> =>  {
      await Utils.msSleep(2000);
      Utils.emitEvent("testGetFullPath001", 10);
      await Utils.msSleep(2000);
      Utils.registerEvent("testGetFullPath001", true, 79676, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testSerializeGroup001
     * @tc.number SUB_WEB_WEBDOWNLOADITEM_SERIALIZE_GROUP_0100
     * @tc.desc   test WebDownloadItem.serialize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSerializeGroup001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> =>  {
      await Utils.msSleep(2000);
      Utils.emitEvent("testSerialize001", 10);
      await Utils.msSleep(2000);
      Utils.registerEvent("testSerialize001", true, 79678, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testDeserializeGroup001
     * @tc.number SUB_WEB_WEBDOWNLOADITEM_DESERIALIZE_GROUP_0100
     * @tc.desc   test WebDownloadItem.deserialize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDeserializeGroup001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> =>  {
      await Utils.msSleep(2000);
      Utils.emitEvent("testDeserialize001", 10);
      await Utils.msSleep(2000);
      Utils.registerEvent("testDeserialize001", true, 79680, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testResume001
     * @tc.number SUB_WEB_WEBDOWNLOADITEM_RESUME_GROUP_0100
     * @tc.desc   test WebDownloadItem.deserialize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testResume001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> =>  {
        await Utils.msSleep(2000);
        Utils.emitEvent("testResume001", 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("testResume001", webview.WebDownloadState.IN_PROGRESS, 79692, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
        await Utils.msSleep(2000);
        done();
    })


    /**
     * @tc.name   testOnBeforeDownloadGroup001
     * @tc.number SUB_WEB_WEBDOWNLOADDELEGATE_ONBEFOREDOWNLOAD_GROUP_0100
     * @tc.desc   test WebDownloadDelegate.onBeforeDownload
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOnBeforeDownloadGroup001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> =>  {
      await Utils.msSleep(2000);
      Utils.emitEvent("testOnBeforeDownload001", 10);
      await Utils.msSleep(2000);
      Utils.registerEvent("testOnBeforeDownload001", true, 79700, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testOnDownloadUpdatedGroup001
     * @tc.number SUB_WEB_WEBDOWNLOADDELEGATE_ONDOWNLOADUPDATED_GROUP_0100
     * @tc.desc   test WebDownloadDelegate.onDownloadUpdated
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOnDownloadUpdatedGroup001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> =>  {
      await Utils.msSleep(2000);
      Utils.emitEvent("testOnDownloadUpdated001", 10);
      await Utils.msSleep(2000);
      Utils.registerEvent("testOnDownloadUpdated001", true, 79702, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testOnDownloadFinishGroup001
     * @tc.number SUB_WEB_WEBDOWNLOADDELEGATE_ONDOWNLOADFINISH_GROUP_0100
     * @tc.desc   test WebDownloadDelegate.onDownloadFinish
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOnDownloadFinishGroup001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> =>  {
      await Utils.msSleep(2000);
      Utils.emitEvent("testOnDownloadFinish001", 10);
      await Utils.msSleep(2000);
      Utils.registerEvent("testOnDownloadFinish001", true, 79704, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testWebDownloadManagerSetDownloadDelegateGroup001
     * @tc.number SUB_WEB_WEBDOWNLOADMANAGER_SETDOWNLOADDELEGATE_GROUP_0100
     * @tc.desc   test WebDownloadManager.setDownloadDelegate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebDownloadManagerSetDownloadDelegateGroup001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> =>  {
      await Utils.msSleep(2000);
      Utils.emitEvent("testWebDownloadManagerSetDownloadDelegate001", 10);
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebDownloadManagerSetDownloadDelegate001", true, 79750, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testResumeDownload001
     * @tc.number SUB_WEB_WEBDOWNLOADMANAGER_RESUMEDOWNLOAD_GROUP_0100
     * @tc.desc   test WebDownloadManager.ResumeDownload
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testResumeDownload001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> =>  {
        await Utils.msSleep(2000);
        Utils.emitEvent("testResumeDownload001", 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("testResumeDownload001", webview.WebDownloadState.IN_PROGRESS, 79752, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
        await Utils.msSleep(2000);
        done();
    })
  })
}

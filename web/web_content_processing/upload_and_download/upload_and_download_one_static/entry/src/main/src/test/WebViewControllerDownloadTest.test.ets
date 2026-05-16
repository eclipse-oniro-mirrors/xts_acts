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
     * @tc.name   testSetDownloadDelegateGroupStatic001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SETDOWNLOADDELEGATE_GROUP_0100
     * @tc.desc   test setDownloadDelegate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetDownloadDelegateGroupStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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
     * @tc.name   testStartDownloadGroupStatic001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_STARTDOWNLOAD_GROUP_0100
     * @tc.desc   test startDownload
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStartDownloadGroupStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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
     * @tc.name   testStartDownloadGroupStatic002
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_STARTDOWNLOAD_GROUP_0200
     * @tc.desc   test startDownload
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStartDownloadGroupStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testStartDownload002", 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("testStartDownload002", 17100002, 79501, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   testWebDownloadStateGroupStatic001
     * @tc.number SUB_WEB_WEBDOWNLOADSTATE_GROUP_0100
     * @tc.desc   test WebDownloadState.IN_PROGRESS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebDownloadStateGroupStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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
     * @tc.name   testWebDownloadStateGroupStatic002
     * @tc.number SUB_WEB_WEBDOWNLOADSTATE_GROUP_0200
     * @tc.desc   test WebDownloadState.COMPLETED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebDownloadStateGroupStatic002',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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
     * @tc.name   testWebDownloadStateGroupStatic003
     * @tc.number SUB_WEB_WEBDOWNLOADSTATE_GROUP_0300
     * @tc.desc   test WebDownloadState.CANCELED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebDownloadStateGroupStatic003',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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
     * @tc.name   testWebDownloadStateGroupStatic004
     * @tc.number SUB_WEB_WEBDOWNLOADSTATE_GROUP_0400
     * @tc.desc   test WebDownloadState.INTERRUPTED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebDownloadStateGroupStatic004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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
     * @tc.name   testWebDownloadStateGroupStatic005
     * @tc.number SUB_WEB_WEBDOWNLOADSTATE_GROUP_0500
     * @tc.desc   test WebDownloadState.PENDING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebDownloadStateGroupStatic005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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
     * @tc.name   testWebDownloadStateGroupStatic006
     * @tc.number SUB_WEB_WEBDOWNLOADSTATE_GROUP_0600
     * @tc.desc   test WebDownloadState.PENDING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebDownloadStateGroupStatic006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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
     * @tc.name   testWebDownloadStateGroupStatic007
     * @tc.number SUB_WEB_WEBDOWNLOADSTATE_GROUP_0700111
     * @tc.desc   test WebDownloadState.IN_PROGRESS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebDownloadStateGroupStatic007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>  {
        await Utils.msSleep(2000);
        Utils.emitEvent("testWebDownloadState007", 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("testWebDownloadState007", webview.WebDownloadState.UNKNOWN, 79500, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   testWebDownloadPauseFailStatic001
     * @tc.number SUB_WEB_WEBDOWNLOADSTATE_GROUP_001
     * @tc.desc   test WebDownloadState.IN_PROGRESS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebDownloadPauseFailStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>  {
        await Utils.msSleep(2000);
        Utils.emitEvent("testWebDownloadPauseFail001", 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("testWebDownloadPauseFail001", 17100019, 79503, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
        await Utils.msSleep(2000);
        done();
    })

    /**
     * @tc.name   testGetGuidGroupStatic001
     * @tc.number SUB_WEB_WEBDOWNLOADITEM_GETGUID_GROUP_0100
     * @tc.desc   test WebDownloadItem.getGuid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetGuidGroupStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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
     * @tc.name   testGetGuidGroupStatic002
     * @tc.number SUB_WEB_WEBDOWNLOADITEM_GETGUID_GROUP_0200
     * @tc.desc   test WebDownloadItem.getGuid when download two files
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetGuidGroupStatic002',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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
     * @tc.name   testGetCurrentSpeedGroupStatic001
     * @tc.number SUB_WEB_WEBDOWNLOADITEM_GETCURRENTSPEED_GROUP_0100
     * @tc.desc   test WebDownloadItem.getCurrentSpeed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetCurrentSpeedGroupStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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
     * @tc.name   testGetPercentCompleteGroupStatic001
     * @tc.number SUB_WEB_WEBDOWNLOADITEM_GETPERCENTCOMPLETE_GROUP_0100
     * @tc.desc   test WebDownloadItem.getPercentComplete
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetPercentCompleteGroupStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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
     * @tc.name   testGetPercentCompleteGroupStatic002
     * @tc.number SUB_WEB_WEBDOWNLOADITEM_GETPERCENTCOMPLETE_GROUP_0200
     * @tc.desc   test WebDownloadItem.getPercentComplete when download finish
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetPercentCompleteGroupStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>  {
      await Utils.msSleep(2000);
      Utils.emitEvent("testGetPercentComplete002", 10);
      await Utils.msSleep(2000);
      Utils.registerEvent("testGetPercentComplete002", 100, 79658, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testGetTotalBytesGroupStatic001
     * @tc.number SUB_WEB_WEBDOWNLOADITEM_GETTOTALBYTES_GROUP_0100
     * @tc.desc   test WebDownloadItem.getTotalBytes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetTotalBytesGroupStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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
     * @tc.name   testGetMethodGroupStatic001
     * @tc.number SUB_WEB_WEBDOWNLOADITEM_GETMETHOD_GROUP_0100
     * @tc.desc   test WebDownloadItem.getMethod
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetMethodGroupStatic001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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
     * @tc.name   testGetMimeTypeGroupStatic001
     * @tc.number SUB_WEB_WEBDOWNLOADITEM_GETMIMETYPE_GROUP_0100
     * @tc.desc   test WebDownloadItem.getMimeType image/png
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetMimeTypeGroupStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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
     * @tc.name   testGetMimeTypeGroupStatic002
     * @tc.number SUB_WEB_WEBDOWNLOADITEM_GETMIMETYPE_GROUP_0200
     * @tc.desc   test WebDownloadItem.getMimeType video/mp4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetMimeTypeGroupStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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
     * @tc.name   testGetMimeTypeGroupStatic003
     * @tc.number SUB_WEB_WEBDOWNLOADITEM_GETMIMETYPE_GROUP_0300
     * @tc.desc   test WebDownloadItem.getMimeType application/x-msdownload
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetMimeTypeGroupStatic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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
     * @tc.name   testGetUrlGroupStatic001
     * @tc.number SUB_WEB_WEBDOWNLOADITEM_GETURL_GROUP_0100
     * @tc.desc   test WebDownloadItem.getUrl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetUrlGroupStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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
     * @tc.name   testGetSuggestedFileNameGroupStatic001
     * @tc.number SUB_WEB_WEBDOWNLOADITEM_GETSUGGESTEDFILENAME_GROUP_0100
     * @tc.desc   test WebDownloadItem.getSuggestedFileName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetSuggestedFileNameGroupStatic001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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
     * @tc.name   testGetReceivedBytesGroupStatic001
     * @tc.number SUB_WEB_WEBDOWNLOADITEM_GETRECEIVEDBYTES_GROUP_0100
     * @tc.desc   test WebDownloadItem.getReceivedBytes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetReceivedBytesGroupStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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
     * @tc.name   testGetFullPathGroupStatic001
     * @tc.number SUB_WEB_WEBDOWNLOADITEM_GETFULLPATH_GROUP_0100
     * @tc.desc   test WebDownloadItem.getFullPath
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetFullPathGroupStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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
     * @tc.name   testSerializeGroupStatic001
     * @tc.number SUB_WEB_WEBDOWNLOADITEM_SERIALIZE_GROUP_0100
     * @tc.desc   test WebDownloadItem.serialize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSerializeGroupStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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
     * @tc.name   testDeserializeGroupStatic001
     * @tc.number SUB_WEB_WEBDOWNLOADITEM_DESERIALIZE_GROUP_0100
     * @tc.desc   test WebDownloadItem.deserialize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDeserializeGroupStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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
     * @tc.name   testResumeStatic001
     * @tc.number SUB_WEB_WEBDOWNLOADITEM_RESUME_GROUP_0100
     * @tc.desc   test WebDownloadItem.deserialize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testResumeStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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
     * @tc.name   testResumeStatic002
     * @tc.number SUB_WEB_WEBDOWNLOADITEM_RESUME_GROUP_0200
     * @tc.desc   test WebDownloadItem.Resume
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testResumeStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>  {
        await Utils.msSleep(2000);
        Utils.emitEvent("testResume002", 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("testResume002", 17100016, 79504, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })


    /**
     * @tc.name   testOnBeforeDownloadGroupStatic001
     * @tc.number SUB_WEB_WEBDOWNLOADDELEGATE_ONBEFOREDOWNLOAD_GROUP_0100
     * @tc.desc   test WebDownloadDelegate.onBeforeDownload
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnBeforeDownloadGroupStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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
     * @tc.name   testOnDownloadUpdatedGroupStatic001
     * @tc.number SUB_WEB_WEBDOWNLOADDELEGATE_ONDOWNLOADUPDATED_GROUP_0100
     * @tc.desc   test WebDownloadDelegate.onDownloadUpdated
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnDownloadUpdatedGroupStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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
     * @tc.name   testOnDownloadFinishGroupStatic001
     * @tc.number SUB_WEB_WEBDOWNLOADDELEGATE_ONDOWNLOADFINISH_GROUP_0100
     * @tc.desc   test WebDownloadDelegate.onDownloadFinish
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnDownloadFinishGroupStatic001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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
     * @tc.name   testWebDownloadManagerSetDownloadDelegateGroupStatic001
     * @tc.number SUB_WEB_WEBDOWNLOADMANAGER_SETDOWNLOADDELEGATE_GROUP_0100
     * @tc.desc   test WebDownloadManager.setDownloadDelegate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebDownloadManagerSetDownloadDelegateGroupStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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
     * @tc.name   testSetDownloadDelegateErrorCodeStaticStatic001
     * @tc.number SUB_WEB_WEBDOWNLOADMANAGER_SETDOWNLOADDELEGATE_0100
     * @tc.desc   test WebDownloadManager.setDownloadDelegate ErrorCode 17100001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetDownloadDelegateErrorCodeStaticStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>  {
      await Utils.msSleep(2000);
      Utils.emitEvent("testSetDownloadDelegateErrorCode001", 10);
      await Utils.msSleep(2000);
      Utils.registerEvent("testSetDownloadDelegateErrorCode001", 17100001, 113930, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testStartDownloadErrorCodeStatic001
     * @tc.number SUB_WEB_ERRORCODE_STARTDOWNLOADERRORCODE_0100
     * @tc.desc   test WebDownloadManager.setDownloadDelegate ErrorCode 17100001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStartDownloadErrorCodeStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>  {
        await Utils.msSleep(2000);
        Utils.emitEvent("testStartDownloadErrorCode001", 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("testStartDownloadErrorCode001", 17100001, 113940, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   testStartDownloadErrorCodeStatic002
     * @tc.number SUB_WEB_ERRORCODE_STARTDOWNLOADERRORCODE_0200
     * @tc.desc   test WebDownloadManager.setDownloadDelegate ErrorCode 17100002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStartDownloadErrorCodeStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>  {
        await Utils.msSleep(2000);
        Utils.emitEvent("testStartDownloadErrorCode002", 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("testStartDownloadErrorCode002", 17100002, 113950, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   testResumeDownloadErrorCodeStatic001
     * @tc.number SUB_WEB_WEBDOWNLOADMANAGER_RESUMEDOWNLOAD_ERRORCODE_GROUP_0100
     * @tc.desc   test WebDownloadManager.ResumeDownload ErrorCode 17100018
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testResumeDownloadErrorCodeStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>  {
        await Utils.msSleep(2000);
        Utils.emitEvent("testResumeDownloadErrorCode001", 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("testResumeDownloadErrorCode001", 17100018, 114070, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   testResumeDownloadStatic001
     * @tc.number SUB_WEB_WEBDOWNLOADMANAGER_RESUMEDOWNLOAD_GROUP_0100
     * @tc.desc   test WebDownloadManager.ResumeDownload
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testResumeDownloadStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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

    /**
     * @tc.name   testGetLastErrorCodeStatic001
     * @tc.number SUB_WEB_WEBDOWNLOADMANAGER_GETLASTERRORCODE_GROUP_0100
     * @tc.desc   test WebDownloadManager.getLastErrorCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetLastErrorCodeStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>  {
        await Utils.msSleep(2000);
        Utils.emitEvent("testWebDownloadGetLastErrorCodeEnumStatic001", 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("testGetLastErrorCodeStatic001", 0, 260326171, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   testGetLastErrorCodeStatic002
     * @tc.number SUB_WEB_WEBDOWNLOADMANAGER_GETLASTERRORCODE_GROUP_0200
     * @tc.desc   test WebDownloadManager.getLastErrorCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetLastErrorCodeStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>  {
        await Utils.msSleep(2000);
        Utils.emitEvent("testWebDownloadGetLastErrorCodeEnumStatic002", 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("testGetLastErrorCodeStatic002", 1, 260326172, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   testGetLastErrorCodeStatic003
     * @tc.number SUB_WEB_WEBDOWNLOADMANAGER_GETLASTERRORCODE_GROUP_0300
     * @tc.desc   test WebDownloadManager.getLastErrorCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetLastErrorCodeStatic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>  {
        await Utils.msSleep(2000);
        Utils.emitEvent("testWebDownloadGetLastErrorCodeEnumStatic003", 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("testGetLastErrorCodeStatic003",2 , 260326173, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   testGetLastErrorCodeStatic004
     * @tc.number SUB_WEB_WEBDOWNLOADMANAGER_GETLASTERRORCODE_GROUP_0400
     * @tc.desc   test WebDownloadManager.getLastErrorCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetLastErrorCodeStatic004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>  {
        await Utils.msSleep(2000);
        Utils.emitEvent("testWebDownloadGetLastErrorCodeEnumStatic004", 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("testGetLastErrorCodeStatic004",3 , 260326174, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   testGetLastErrorCodeStatic005
     * @tc.number SUB_WEB_WEBDOWNLOADMANAGER_GETLASTERRORCODE_GROUP_0500
     * @tc.desc   test WebDownloadManager.getLastErrorCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetLastErrorCodeStatic005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>  {
        await Utils.msSleep(2000);
        Utils.emitEvent("testWebDownloadGetLastErrorCodeEnumStatic005", 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("testGetLastErrorCodeStatic005", 5, 260326175, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   testGetLastErrorCodeStatic006
     * @tc.number SUB_WEB_WEBDOWNLOADMANAGER_GETLASTERRORCODE_GROUP_0600
     * @tc.desc   test WebDownloadManager.getLastErrorCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetLastErrorCodeStatic006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>  {
        await Utils.msSleep(2000);
        Utils.emitEvent("testWebDownloadGetLastErrorCodeEnumStatic006", 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("testGetLastErrorCodeStatic006", 6, 260326176, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   testGetLastErrorCodeStatic007
     * @tc.number SUB_WEB_WEBDOWNLOADMANAGER_GETLASTERRORCODE_GROUP_0700
     * @tc.desc   test WebDownloadManager.getLastErrorCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetLastErrorCodeStatic007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>  {
        await Utils.msSleep(2000);
        Utils.emitEvent("testWebDownloadGetLastErrorCodeEnumStatic007", 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("testGetLastErrorCodeStatic007",10 , 260326177, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   testGetLastErrorCodeStatic008
     * @tc.number SUB_WEB_WEBDOWNLOADMANAGER_GETLASTERRORCODE_GROUP_0800
     * @tc.desc   test WebDownloadManager.getLastErrorCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetLastErrorCodeStatic008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>  {
        await Utils.msSleep(2000);
        Utils.emitEvent("testWebDownloadGetLastErrorCodeEnumStatic008", 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("testGetLastErrorCodeStatic008", 11, 260326178, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   testGetLastErrorCodeStatic009
     * @tc.number SUB_WEB_WEBDOWNLOADMANAGER_GETLASTERRORCODE_GROUP_0900
     * @tc.desc   test WebDownloadManager.getLastErrorCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetLastErrorCodeStatic009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>  {
        await Utils.msSleep(2000);
        Utils.emitEvent("testWebDownloadGetLastErrorCodeEnumStatic009", 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("testGetLastErrorCodeStatic009",13 , 260326179, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   testGetLastErrorCodeStatic010
     * @tc.number SUB_WEB_WEBDOWNLOADMANAGER_GETLASTERRORCODE_GROUP_1000
     * @tc.desc   test WebDownloadManager.getLastErrorCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetLastErrorCodeStatic010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>  {
        await Utils.msSleep(2000);
        Utils.emitEvent("testWebDownloadGetLastErrorCodeEnumStatic010", 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("testGetLastErrorCodeStatic010",14 , 260326180, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   testGetLastErrorCodeStatic011
     * @tc.number SUB_WEB_WEBDOWNLOADMANAGER_GETLASTERRORCODE_GROUP_1100
     * @tc.desc   test WebDownloadManager.getLastErrorCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetLastErrorCodeStatic011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>  {
        await Utils.msSleep(2000);
        Utils.emitEvent("testWebDownloadGetLastErrorCodeEnumStatic011", 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("testGetLastErrorCodeStatic011",15 , 260326181, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   testGetLastErrorCodeStatic012
     * @tc.number SUB_WEB_WEBDOWNLOADMANAGER_GETLASTERRORCODE_GROUP_1200
     * @tc.desc   test WebDownloadManager.getLastErrorCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetLastErrorCodeStatic012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>  {
        await Utils.msSleep(2000);
        Utils.emitEvent("testWebDownloadGetLastErrorCodeEnumStatic012", 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("testGetLastErrorCodeStatic012",20 , 260326182, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   testGetLastErrorCodeStatic013
     * @tc.number SUB_WEB_WEBDOWNLOADMANAGER_GETLASTERRORCODE_GROUP_1300
     * @tc.desc   test WebDownloadManager.getLastErrorCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetLastErrorCodeStatic013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>  {
        await Utils.msSleep(2000);
        Utils.emitEvent("testWebDownloadGetLastErrorCodeEnumStatic013", 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("testGetLastErrorCodeStatic013",21 , 260326183, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   testGetLastErrorCodeStatic014
     * @tc.number SUB_WEB_WEBDOWNLOADMANAGER_GETLASTERRORCODE_GROUP_1400
     * @tc.desc   test WebDownloadManager.getLastErrorCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetLastErrorCodeStatic014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>  {
        await Utils.msSleep(2000);
        Utils.emitEvent("testWebDownloadGetLastErrorCodeEnumStatic014", 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("testGetLastErrorCodeStatic014",22 , 260326184, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   testGetLastErrorCodeStatic015
     * @tc.number SUB_WEB_WEBDOWNLOADMANAGER_GETLASTERRORCODE_GROUP_1500
     * @tc.desc   test WebDownloadManager.getLastErrorCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetLastErrorCodeStatic015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>  {
        await Utils.msSleep(2000);
        Utils.emitEvent("testWebDownloadGetLastErrorCodeEnumStatic015", 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("testGetLastErrorCodeStatic015",23 , 260326185, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   testGetLastErrorCodeStatic016
     * @tc.number SUB_WEB_WEBDOWNLOADMANAGER_GETLASTERRORCODE_GROUP_1600
     * @tc.desc   test WebDownloadManager.getLastErrorCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetLastErrorCodeStatic016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>  {
        await Utils.msSleep(2000);
        Utils.emitEvent("testWebDownloadGetLastErrorCodeEnumStatic016", 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("testGetLastErrorCodeStatic016",24 , 260326186, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   testGetLastErrorCodeStatic017
     * @tc.number SUB_WEB_WEBDOWNLOADMANAGER_GETLASTERRORCODE_GROUP_1700
     * @tc.desc   test WebDownloadManager.getLastErrorCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetLastErrorCodeStatic017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>  {
        await Utils.msSleep(2000);
        Utils.emitEvent("testWebDownloadGetLastErrorCodeEnumStatic017", 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("testGetLastErrorCodeStatic017",30 , 260326187, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   testGetLastErrorCodeStatic018
     * @tc.number SUB_WEB_WEBDOWNLOADMANAGER_GETLASTERRORCODE_GROUP_1800
     * @tc.desc   test WebDownloadManager.getLastErrorCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetLastErrorCodeStatic018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>  {
        await Utils.msSleep(2000);
        Utils.emitEvent("testWebDownloadGetLastErrorCodeEnumStatic018", 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("testGetLastErrorCodeStatic018",31 , 260326188, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   testGetLastErrorCodeStatic019
     * @tc.number SUB_WEB_WEBDOWNLOADMANAGER_GETLASTERRORCODE_GROUP_1900
     * @tc.desc   test WebDownloadManager.getLastErrorCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetLastErrorCodeStatic019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>  {
        await Utils.msSleep(2000);
        Utils.emitEvent("testWebDownloadGetLastErrorCodeEnumStatic019", 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("testGetLastErrorCodeStatic019",33 , 260326189, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   testGetLastErrorCodeStatic020
     * @tc.number SUB_WEB_WEBDOWNLOADMANAGER_GETLASTERRORCODE_GROUP_2000
     * @tc.desc   test WebDownloadManager.getLastErrorCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetLastErrorCodeStatic020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>  {
        await Utils.msSleep(2000);
        Utils.emitEvent("testWebDownloadGetLastErrorCodeEnumStatic020", 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("testGetLastErrorCodeStatic020",34 , 260326190, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   testGetLastErrorCodeStatic021
     * @tc.number SUB_WEB_WEBDOWNLOADMANAGER_GETLASTERRORCODE_GROUP_2100
     * @tc.desc   test WebDownloadManager.getLastErrorCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetLastErrorCodeStatic021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>  {
        await Utils.msSleep(2000);
        Utils.emitEvent("testWebDownloadGetLastErrorCodeEnumStatic021", 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("testGetLastErrorCodeStatic021",35 , 260326191, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   testGetLastErrorCodeStatic022
     * @tc.number SUB_WEB_WEBDOWNLOADMANAGER_GETLASTERRORCODE_GROUP_2200
     * @tc.desc   test WebDownloadManager.getLastErrorCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetLastErrorCodeStatic022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>  {
        await Utils.msSleep(2000);
        Utils.emitEvent("testWebDownloadGetLastErrorCodeEnumStatic022", 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("testGetLastErrorCodeStatic022",36 , 260326192, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   testGetLastErrorCodeStatic023
     * @tc.number SUB_WEB_WEBDOWNLOADMANAGER_GETLASTERRORCODE_GROUP_2300
     * @tc.desc   test WebDownloadManager.getLastErrorCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetLastErrorCodeStatic023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>  {
        await Utils.msSleep(2000);
        Utils.emitEvent("testWebDownloadGetLastErrorCodeEnumStatic023", 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("testGetLastErrorCodeStatic023",37 , 260326193, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   testGetLastErrorCodeStatic024
     * @tc.number SUB_WEB_WEBDOWNLOADMANAGER_GETLASTERRORCODE_GROUP_2400
     * @tc.desc   test WebDownloadManager.getLastErrorCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetLastErrorCodeStatic024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>  {
        await Utils.msSleep(2000);
        Utils.emitEvent("testWebDownloadGetLastErrorCodeEnumStatic024", 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("testGetLastErrorCodeStatic024",38 , 260326194, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   testGetLastErrorCodeStatic025
     * @tc.number SUB_WEB_WEBDOWNLOADMANAGER_GETLASTERRORCODE_GROUP_2500
     * @tc.desc   test WebDownloadManager.getLastErrorCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetLastErrorCodeStatic025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>  {
        await Utils.msSleep(2000);
        Utils.emitEvent("testWebDownloadGetLastErrorCodeEnumStatic025", 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("testGetLastErrorCodeStatic025",39 , 260326195, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   testGetLastErrorCodeStatic026
     * @tc.number SUB_WEB_WEBDOWNLOADMANAGER_GETLASTERRORCODE_GROUP_2600
     * @tc.desc   test WebDownloadManager.getLastErrorCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetLastErrorCodeStatic026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>  {
        await Utils.msSleep(2000);
        Utils.emitEvent("testWebDownloadGetLastErrorCodeEnumStatic026", 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("testGetLastErrorCodeStatic026",40 , 260326196, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   testGetLastErrorCodeStatic027
     * @tc.number SUB_WEB_WEBDOWNLOADMANAGER_GETLASTERRORCODE_GROUP_2700
     * @tc.desc   test WebDownloadManager.getLastErrorCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetLastErrorCodeStatic027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>  {
        await Utils.msSleep(2000);
        Utils.emitEvent("testWebDownloadGetLastErrorCodeEnumStatic027", 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("testGetLastErrorCodeStatic027",41 , 260326197, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   testGetLastErrorCodeStatic028
     * @tc.number SUB_WEB_WEBDOWNLOADMANAGER_GETLASTERRORCODE_GROUP_2800
     * @tc.desc   test WebDownloadManager.getLastErrorCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetLastErrorCodeStatic028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>  {
        await Utils.msSleep(2000);
        Utils.emitEvent("testWebDownloadGetLastErrorCodeEnumStatic028", 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("testGetLastErrorCodeStatic028",50 , 260326198, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   testGetStateStatic001
     * @tc.number SUB_WEB_WEBDOWNLOADMANAGER_GETSTATE_GROUP_0100
     * @tc.desc   test WebDownloadManager.getState
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetStateStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>  {
        await Utils.msSleep(2000);
        Utils.emitEvent("testWebDownloadGetStateEnumStatic001", 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("testGetStateStatic001",0 , 2603261981, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   testGetStateStatic002
     * @tc.number SUB_WEB_WEBDOWNLOADMANAGER_GETSTATE_GROUP_0200
     * @tc.desc   test WebDownloadManager.getState
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetStateStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>  {
        await Utils.msSleep(2000);
        Utils.emitEvent("testWebDownloadGetStateEnumStatic002", 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("testGetStateStatic002",1 , 2603261982, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   testGetStateStatic003
     * @tc.number SUB_WEB_WEBDOWNLOADMANAGER_GETSTATE_GROUP_0300
     * @tc.desc   test WebDownloadManager.getState
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetStateStatic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>  {
        await Utils.msSleep(2000);
        Utils.emitEvent("testWebDownloadGetStateEnumStatic003", 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("testGetStateStatic003",2 , 2603261983, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   testGetStateStatic004
     * @tc.number SUB_WEB_WEBDOWNLOADMANAGER_GETSTATE_GROUP_0400
     * @tc.desc   test WebDownloadManager.getState
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetStateStatic004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>  {
        await Utils.msSleep(2000);
        Utils.emitEvent("testWebDownloadGetStateEnumStatic004", 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("testGetStateStatic004",3 , 2603261984, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   testGetStateStatic005
     * @tc.number SUB_WEB_WEBDOWNLOADMANAGER_GETSTATE_GROUP_0500
     * @tc.desc   test WebDownloadManager.getState
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetStateStatic005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>  {
        await Utils.msSleep(2000);
        Utils.emitEvent("testWebDownloadGetStateEnumStatic005", 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("testGetStateStatic005",4 , 2603261985, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   testGetStateStatic006
     * @tc.number SUB_WEB_WEBDOWNLOADMANAGER_GETSTATE_GROUP_0600
     * @tc.desc   test WebDownloadManager.getState
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetStateStatic006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>  {
        await Utils.msSleep(2000);
        Utils.emitEvent("testWebDownloadGetStateEnumStatic006", 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("testGetStateStatic006",5 , 2603261986, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   testGetStateStatic007
     * @tc.number SUB_WEB_WEBDOWNLOADMANAGER_GETSTATE_GROUP_0700
     * @tc.desc   test WebDownloadManager.getState
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetStateStatic007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>  {
        await Utils.msSleep(2000);
        Utils.emitEvent("testWebDownloadGetStateEnumStatic007", 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("testGetStateStatic007",6 , 2603261987, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebViewControllerDownloadTestButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })
  })
}

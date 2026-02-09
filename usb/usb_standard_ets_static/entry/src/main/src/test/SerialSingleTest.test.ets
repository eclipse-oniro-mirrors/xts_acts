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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import Utils from './Util.test';
import buffer from '@ohos.buffer';
import serialManager from '@ohos.usbManager.serial';

let domain: int = 0x0000;
const TAG: string = "[SerialTest]";
let portIds: int[] = [];

function checkDevice(): boolean {
  let haveDevice: boolean = false;
  try {
    const portList = serialManager.getPortList();
    if (Array.isArray(portList)) {
      portList.forEach((port) => {
        portIds.push(port.portId);
        haveDevice = true;
      });
    } else {
      hilog.error(domain, TAG, '%{public}s', `Failed! getPortList, did not return an array: ${typeof portList}`);
      haveDevice = false;
    }
  } catch (error : BusinessError) {
    hilog.error(domain, TAG, '%{public}s', `Failed! getPortList, error code: ${error}`);
    haveDevice = false;
  }
  return haveDevice;
}

export default function SerialSingleTest() {
  describe('SerialSingleTest', () => {
    let openPortId: int = -1;
    beforeAll(() => {
      try {
        if (checkDevice()) {
          openPortId = portIds[0];
          let hasRight: boolean = serialManager.hasSerialRight(openPortId);
          if (!hasRight) {
            hilog.info(domain, TAG, 'beforeEach: requestSerialRight start');
            let futureRes: Promise<boolean> = serialManager.requestSerialRight(openPortId);
            try {
              let hasRight: boolean = await futureRes;
              hilog.info(domain, TAG, 'getPermission isAgree: ', hasRight);
            } catch (err : BusinessError) {
              hilog.error(domain, TAG, 'getPermission catch err name: ', err.name, ', message: ', err.message);
            }
          }
        } else {
          hilog.error(domain, TAG, 'no device');
        }
      } catch(error : BusinessError){
        hilog.info(domain, TAG, 'beforeAll error: ', JSON.stringify(error));
      }
    })
    afterAll(async () => {
      hilog.info(domain, TAG, 'afterAll');
      if (serialManager.hasSerialRight(openPortId)){
        serialManager.close(openPortId);
        serialManager.cancelSerialRight(openPortId);
      }
    })

    /**
     * @tc.name   testRead001
     * @tc.number SUB_USB_HostMgr_SerialSingle_read_ErrCode_0100
     * @tc.desc   read timeout.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRead001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, TAG, 'testRead001 start');
      if (checkDevice() === false) {
        done();
        return Promise.resolve();
      } else {
        try {
          await Utils.msSleep(1000);
          serialManager.open(openPortId);
          await Utils.msSleep(1000);
          let readBuffer: Uint8Array = new Uint8Array(8192);
          await serialManager.read(openPortId, readBuffer, 10);
          expect().assertFail();
        } catch (error : BusinessError) {
          hilog.error(domain, TAG, 'testRead001 catch err name: ', error);
          expect(error.code).assertEqual(31400006);
          done();
        }
      }
    })

    /**
     * @tc.name   testReadSync001
     * @tc.number SUB_USB_HostMgr_SerialSingle_readSync_ErrCode_0100
     * @tc.desc   read timeout.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReadSync001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, TAG, 'testReadSync001 start');
      if (checkDevice() === false) {
        done();
        return Promise.resolve();
      } else {
        try {
          let readSyncBuffer: Uint8Array = new Uint8Array(8192);
          let length: int = serialManager.readSync(openPortId, readSyncBuffer, 10);
          expect().assertFail();
        } catch (error : BusinessError) {
          hilog.error(domain, TAG, 'testReadSync001 catch err code: ', error.code, ', message: ', error.message);
          expect(error.code).assertEqual(31400006);
          serialManager.close(openPortId);
          done();
        }
      }
    })
  })
}
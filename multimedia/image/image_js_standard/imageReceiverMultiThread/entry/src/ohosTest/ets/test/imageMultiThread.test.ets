/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
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

import worker, { MessageEvents } from "@ohos.worker";
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { BusinessError } from '@kit.BasicServicesKit';
import { abilityDelegatorRegistry, BY, UiDriver } from '@kit.TestKit';
import { abilityAccessCtrl, common, PermissionRequestResult, Permissions } from '@kit.AbilityKit';
import { camera } from '@kit.CameraKit';

const TAG = "multiThreadTest: ";


export function isSupportedCameras() : boolean {
  const cameraAvailable = canIUse('SystemCapability.Multimedia.Camera.Core');
  let context: common.UIAbilityContext = AppStorage.get<common.UIAbilityContext>('testContext') as common.UIAbilityContext

  let isSupportedCameras = true;
  let isSupportedCameraManager = false;
  let mCameraManager: camera.CameraManager;
  let mCameraDevicesArray: Array<camera.CameraDevice>;

  let isEmpty = (data: ESObject) => {
    if (data == null || data == undefined) {
      return true;
    }
    return false;
  }

  console.info(TAG + 'Enter getCameraManagerInstance');
  try {
    mCameraManager = camera.getCameraManager(context);
    if (isEmpty(mCameraManager)) {
      console.info(TAG + "getCameraManager FAILED");
      isSupportedCameraManager = false;
      return isSupportedCameraManager;
    }
    console.info(TAG + 'Exit getCameraManagerInstance');
    mCameraDevicesArray = mCameraManager.getSupportedCameras();
    if (isEmpty(mCameraDevicesArray)) {
      isSupportedCameras = false;
    }
  } catch (err) {
    console.error(TAG + "getCameraManager FAILED. errorMessage:",err);
    isSupportedCameraManager = false;
    return isSupportedCameraManager;
  }
  if (cameraAvailable && isSupportedCameras) {
    isSupportedCameraManager = true;
  } else {
    isSupportedCameraManager = false;
  }
  return isSupportedCameraManager;
}
async function createDualChannelPreview(cameraManager: camera.CameraManager, imageReceiverSurfaceIdArray: Array<string>): Promise<void> {
  try {
    // 获取支持的相机设备对象
    let camerasDevices: Array<camera.CameraDevice> = cameraManager.getSupportedCameras();

    // 获取支持的模式类型
    let sceneModes: Array<camera.SceneMode> = cameraManager.getSupportedSceneModes(camerasDevices[0]);
    console.info('aftera cameraManager.getSupportedSceneModes')
    let isSupportPhotoMode: boolean = sceneModes.indexOf(camera.SceneMode.NORMAL_PHOTO) >= 0;
    if (!isSupportPhotoMode) {
      console.error('photo mode not support');
      return;
    }
    // 获取profile对象
    let profiles: camera.CameraOutputCapability =
      cameraManager.getSupportedOutputCapability(camerasDevices[0], camera.SceneMode.NORMAL_PHOTO); // 获取对应相机设备profiles
    let previewProfiles: Array<camera.Profile> = profiles.previewProfiles;

    // 预览流1
    let previewProfilesObj1: camera.Profile = previewProfiles[0];
    // 预览流2
    let previewProfilesObj2: camera.Profile = previewProfiles[0];

    // 创建 预览流1 输出对象
    let previewOutput1: camera.PreviewOutput =
      cameraManager.createPreviewOutput(previewProfilesObj1, imageReceiverSurfaceIdArray[0]);

    // 创建 预览流2 输出对象
    let previewOutput2: camera.PreviewOutput =
      cameraManager.createPreviewOutput(previewProfilesObj2, imageReceiverSurfaceIdArray[1]);

    // 创建cameraInput对象
    let cameraInput: camera.CameraInput = cameraManager.createCameraInput(camerasDevices[0]);

    // 打开相机
    await cameraInput.open();

    // 会话流程
    let photoSession: camera.PhotoSession =
      cameraManager.createSession(camera.SceneMode.NORMAL_PHOTO) as camera.PhotoSession;

    // 开始配置会话
    photoSession.beginConfig();

    // 把CameraInput加入到会话
    photoSession.addInput(cameraInput);

    // 把 预览流1 加入到会话
    photoSession.addOutput(previewOutput1);
    // 把 预览流2 加入到会话
    photoSession.addOutput(previewOutput2);

    // 提交配置信息
    await photoSession.commitConfig();

    // 会话开始
    await photoSession.start();

    await sleep(5000);
    // 停止当前会话
    await photoSession.stop();

    // 释放相机输入流
    await cameraInput.close();

    // 释放拍照输出流
    await previewOutput1.release();
    // 释放拍照输出流
    await previewOutput2.release();

    // 释放会话
    await photoSession.release();
  } catch (err) {
    console.info('err is: ' + err);
  }
}

let sleep = (ms: number): Promise<ESObject> => {
  return new Promise(resolve => setTimeout(resolve, ms));
}

const THREAD_COUNT = 2;

async function promiseCase() {
  return new Promise<string>((resolve, reject) => {
    setTimeout(() => {
      resolve("ok");
    }, 100);
  }).then(undefined, (error: BusinessError) => { })
}

async function terminateThreads(threadWorks: Array<worker.ThreadWorker>, count: number) {
  let a = count;
  let threadExitFlags = 0;
  while (a > 0) {
    threadWorks[a].onexit = () => {
      threadExitFlags += 1;
    }
    threadWorks[a].terminate();
    a -= 1;
  }
  while (threadExitFlags != count) {
    await promiseCase();
  }
}
async function doTestForReceiver(done: Function, cameraManager: camera.CameraManager, name: string, runner: string) {
  let threadWorks: Array<worker.ThreadWorker> = [];
  let threadExitFlags = 0;
  console.info("Test " + name + " start!!");
  let numFlag = 0;
  let imageReceiverSurfaceIdArray: Array<string> = new Array<string>(8);
  try {
    let a = 0;
    while (a < THREAD_COUNT) {
      threadWorks[a] = new worker.ThreadWorker(runner);
      threadWorks[a].onmessage = (e: MessageEvents) => {
        console.info('data is: ' + e.data);
        let recvNum: number = e.data as number;
        if(recvNum < THREAD_COUNT) {
          console.info(name + " worker:: ending work " + recvNum);
          threadWorks[recvNum].terminate();
        } else {
          try {
            let imageReceiverSurfaceId: string = e.data as string;
            imageReceiverSurfaceIdArray[numFlag] = imageReceiverSurfaceId
            numFlag = numFlag + 1;
            if(numFlag == THREAD_COUNT) {
              createDualChannelPreview(cameraManager, imageReceiverSurfaceIdArray);
            }
            else {
            }
          }
          catch (err) {
            console.info('err is: ' + err);
          }
        }
      }
      threadWorks[a].onexit = () => {
        threadExitFlags += 1;
      }
      a += 1;
    }
    // For threads ready
    await promiseCase();

    let b = 0;
    while (b < THREAD_COUNT) {
      threadWorks[b].postMessage(b);
      b += 1;
    }

    while (threadExitFlags != THREAD_COUNT) {
      await promiseCase();
    }
    expect(true).assertTrue()
    done();
  } catch (error) {
    console.info('Case error, ' + JSON.stringify(error.message));
    await terminateThreads(threadWorks, THREAD_COUNT);
    done();
    expect(false).assertTrue()
  }
}

async function doTestForCreator(done: Function, name: string, runner: string) {
  let threadWorks: Array<worker.ThreadWorker> = [];
  let threadExitFlags = 0;
  console.info("Test " + name + " start!!");
  try {
    let a = 0;
    while (a < THREAD_COUNT) {
      threadWorks[a] = new worker.ThreadWorker(runner);
      threadWorks[a].onmessage = (e: MessageEvents) => {
        console.info(name + "worker:: ending work " + e.data);
        if (e.data != undefined) {
          threadWorks[e.data].terminate();
        }
      }
      threadWorks[a].onexit = () => {
        threadExitFlags += 1;
      }
      a += 1;
    }
    // For threads ready
    await promiseCase();

    let b = 0;
    while (b < THREAD_COUNT) {
      threadWorks[b].postMessage(b);
      b += 1;
    }

    while (threadExitFlags != THREAD_COUNT) {
      await promiseCase();
    }
    expect(true).assertTrue();
    done();
  } catch (error) {
    console.info('Case error, ' + JSON.stringify(error.message));
    await terminateThreads(threadWorks, THREAD_COUNT);
    done();
    expect(false).assertTrue()
  }
}

let getPermission = async () => {
  console.info('getPermission start');
  let testContext: common.UIAbilityContext = AppStorage.get<common.UIAbilityContext>('testContext') as common.UIAbilityContext
  let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
  let permissions: Array<Permissions> = ['ohos.permission.CAMERA'];
  console.info('permissions: Array<Permissions> = [\'ohos.permission.CAMERA\']')
  try {
    atManager.requestPermissionsFromUser(getContext(), permissions).then((data: PermissionRequestResult) => {
      console.info('data:' + JSON.stringify(data))
      console.info('data permissions:' + data.permissions)
    })
  } catch (err) {
    console.info('err is ' + err);
  }
}


async function permissionClick() {
  console.info(`come in permissionClick`);
  let driver = await UiDriver.create();
  console.info(`driver is ${JSON.stringify(driver)}`);
  await sleep(100);
  console.info(`UiDriver start`);
  let button = await driver.findComponent(BY.text('允许'));
  if (button == null) {
    let delegator = abilityDelegatorRegistry.getAbilityDelegator();
    let cmd = "hidumper -s WindowManagerService -a'-a'"
    await delegator.executeShellCommand(cmd);
  }
  console.info(`button is ${JSON.stringify(button)}`);
  await sleep(100);
  if (button != null && button != undefined) {
    await button.click();
  }
  await sleep(1000);
}

export default function multiThreadTest() {
  describe('multiThreadTest', () => {
    afterAll(() => {
      console.info('total case over');
    });
    beforeAll(async () => {
      console.info('total case before');
      await sleep(1000);
      await getPermission();
      await permissionClick();
    })
    beforeEach(async () => {
      console.info('Each case before');
      await sleep(100);
    })

    afterEach(async () => {
      console.info('after each case');
      await sleep(100);
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_RECEIVER_MULTI_THREAD_0100
     * @tc.name      : multiple thread
     * @tc.desc      : 1.create receiver.ets
     *                 2.invoked simultaneously by multiple thread
     * @tc.size      : MEDIUM+
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_RECEIVER_MULTI_THREAD_0100', 0, async (done: Function) => {
      await doTestForCreator(done, "SUB_MULTIMEDIA_IMAGE_RECEIVER_MULTI_THREAD_0100", "entry_test/ets/workers/creator.ets");
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_RECEIVER_MULTI_THREAD_0200
     * @tc.name      : multiple thread
     * @tc.desc      : 1.create creator.ets
     *                 2.invoked simultaneously by multiple thread
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_RECEIVER_MULTI_THREAD_0200', 0, async (done: Function) => {
      let isSupportedCamerasResult = isSupportedCameras(); 
      if(!isSupportedCamerasResult){
        console.info('Failed to obtain the default camera or device object.Not support usb camera');
        expect(true).assertTrue();
        done();
      }
      let testContext: common.UIAbilityContext = AppStorage.get<common.UIAbilityContext>('testContext') as common.UIAbilityContext
      let cameraManager = camera.getCameraManager(testContext);
      await doTestForReceiver(done, cameraManager, "SUB_MULTIMEDIA_IMAGE_RECEIVER_MULTI_THREAD_0200", "entry_test/ets/workers/receiver.ets");
    });
  })
}
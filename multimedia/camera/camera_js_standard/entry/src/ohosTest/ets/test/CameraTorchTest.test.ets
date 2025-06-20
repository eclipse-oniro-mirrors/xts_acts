/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import camera from '@ohos.multimedia.camera';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';

const TAG = "CameraModuleTest: ";

let mCameraManager: camera.CameraManager;
let mCameraNum: number;

let context = getContext();

let sleep = (ms: number = 66): Promise<string> => {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve('');
    }, ms)
  })
}

export default function cameraTorchTest() {

  let isEmpty = (data: ESObject) => {
    if (data == null || data == undefined) {
      return true;
    }
    return false;
  }

  let getCameraManagerInstance = () => {
    console.info('Enter getCameraManagerInstance');
    mCameraManager = camera.getCameraManager(context);
    if (isEmpty(mCameraManager)) {
      console.info(TAG + "getCameraManager FAILED");
      return false;
    }
    console.info('Exit getCameraManagerInstance');
    return true;
  }

  describe('cameraTorchTest', () => {
    console.info(TAG + '----------CameraSessionTest--------------')
    beforeAll(async () => {
      getCameraManagerInstance();
      console.info('beforeAll case');
    })

    beforeEach(async () => {
      console.info('beforeEach case');
    })

    afterEach(async () => {
      console.info('afterEach case');
    })

    afterAll(() => {
      console.info('afterAll case');
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_SETTORCHMODE_ON_0100
     * @tc.name      : setTorchMode(); 设置手电筒模式开关 setTorchMode(ON)
     * @tc.desc      : setTorchMode(); 设置手电筒模式开关 setTorchMode(ON)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_SETTORCHMODE_ON_0100', 2, async (done: Function) => {
      if (mCameraNum == 0) {
        console.info(`${TAG} SUB_MULTIMEDIA_CAMERA_SETTORCHMODE_ON_0100 FAILED with NoCamera`);
        expect().assertFail();
        done();
      } else {
        try {
          let isTorchSupportedStatus = mCameraManager.isTorchSupported();
          console.info(`${TAG} isTorchSupportedStatus: ${isTorchSupportedStatus}`);
          if (isTorchSupportedStatus) {
            let isTorchModeSupported = mCameraManager.isTorchModeSupported(camera.TorchMode.ON);
            console.info(`${TAG} isTorchModeSupported: ${isTorchModeSupported}`);
            if (isTorchModeSupported) {
              mCameraManager.setTorchMode(camera.TorchMode.ON);
              let torchMode = mCameraManager.getTorchMode()
              console.info(`${TAG} torchMode: ${torchMode}`);
              expect(torchMode === camera.TorchMode.ON).assertTrue()
            }
          }
          done();
        } catch (error) {
          console.info(`${TAG} SUB_MULTIMEDIA_CAMERA_SETTORCHMODE_ON_0100 err` + JSON.stringify(error));
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_SETTORCHMODE_OFF_0100
     * @tc.name      : setTorchMode(); 设置手电筒模式开关 setTorchMode(OFF)
     * @tc.desc      : setTorchMode(); 设置手电筒模式开关 setTorchMode(OFF)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_SETTORCHMODE_OFF_0100', 2, async (done: Function) => {
      if (mCameraNum == 0) {
        console.info(`${TAG} SUB_MULTIMEDIA_CAMERA_SETTORCHMODE_OFF_0100 FAILED with NoCamera`);
        expect().assertFail();
        done();
      } else {
        try {
          let isTorchSupportedStatus = mCameraManager.isTorchSupported();
          console.info(`${TAG} isTorchSupportedStatus: ${isTorchSupportedStatus}`);
          if (isTorchSupportedStatus) {
            let isTorchModeSupported = mCameraManager.isTorchModeSupported(camera.TorchMode.OFF);
            console.info(`${TAG} isTorchModeSupported: ${isTorchModeSupported}`);
            if (isTorchModeSupported) {
              mCameraManager.setTorchMode(camera.TorchMode.OFF);
              let torchMode = mCameraManager.getTorchMode()
              console.info(`${TAG} torchMode: ${torchMode}`);
              expect(torchMode === camera.TorchMode.OFF).assertTrue()
            }
          }
          done();
        } catch (error) {
          console.info(`${TAG} SUB_MULTIMEDIA_CAMERA_SETTORCHMODE_OFF_0100 err` + JSON.stringify(error));
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_SETTORCHMODE_AUTO_0100
     * @tc.name      : setTorchMode(); 设置手电筒模式开关 setTorchMode(AUTO)
     * @tc.desc      : setTorchMode(); 设置手电筒模式开关 setTorchMode(AUTO)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_SETTORCHMODE_AUTO_0100', 2, async (done: Function) => {
      if (mCameraNum == 0) {
        console.info(`${TAG} SUB_MULTIMEDIA_CAMERA_SETTORCHMODE_AUTO_0100 FAILED with NoCamera`);
        expect().assertFail();
        done();
      } else {
        try {
          let isTorchSupportedStatus = mCameraManager.isTorchSupported();
          console.info(`${TAG} isTorchSupportedStatus: ${isTorchSupportedStatus}`);
          if (isTorchSupportedStatus) {
            let isTorchModeSupported = mCameraManager.isTorchModeSupported(camera.TorchMode.AUTO);
            console.info(`${TAG} isTorchModeSupported: ${isTorchModeSupported}`);
            if (isTorchModeSupported) {
              mCameraManager.setTorchMode(camera.TorchMode.AUTO);
              let torchMode = mCameraManager.getTorchMode()
              console.info(`${TAG} torchMode: ${torchMode}`);
              expect(torchMode === camera.TorchMode.AUTO).assertTrue()
            }
          }
          done();
        } catch (error) {
          console.info(`${TAG} SUB_MULTIMEDIA_CAMERA_SETTORCHMODE_AUTO_0100 err` + JSON.stringify(error));
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ON_TORCH_STATUS_CHANGE_0100
     * @tc.name      : on 监听，手电筒更改模式OFF2ON
     * @tc.desc      : on 监听，手电筒更改模式OFF2ON
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_ON_TORCH_STATUS_CHANGE_0100', 2, async (done: Function) => {
      if (mCameraNum == 0) {
        console.info(`${TAG} SUB_MULTIMEDIA_CAMERA_ON_TORCH_STATUS_CHANGE_0100 FAILED with NoCamera`);
        expect().assertFail();
        done();
      } else {
        try {
          let isTorchSupportedStatus = mCameraManager.isTorchSupported();
          console.info(`${TAG} isTorchSupportedStatus: ${isTorchSupportedStatus}`);
          if (isTorchSupportedStatus) {
            let isTorchModeSupported = mCameraManager.isTorchModeSupported(camera.TorchMode.OFF);
            console.info(`${TAG} isTorchModeSupported: ${isTorchModeSupported}`);
            if (isTorchModeSupported) {
              mCameraManager.setTorchMode(camera.TorchMode.OFF);
              console.info(`${TAG} setTorchMode OFF success`);
              mCameraManager.on('torchStatusChange', (err, TorchStatusInfo) => {
                if (err) {
                  console.info(`${TAG} torchStatusChange err:` + JSON.stringify(err));
                  expect().assertFail();
                  done();
                }
                console.info(`${TAG} TorchStatusInfo.isTorchAvailable: ${TorchStatusInfo.isTorchAvailable}`);
                console.info(`${TAG} TorchStatusInfo.isTorchActive: ${TorchStatusInfo.isTorchActive}`);
                console.info(`${TAG} TorchStatusInfo.torchLevel: ${TorchStatusInfo.torchLevel}`);
              });
              isTorchModeSupported = mCameraManager.isTorchModeSupported(camera.TorchMode.ON);
              if (isTorchModeSupported) {
                mCameraManager.setTorchMode(camera.TorchMode.ON);
                console.info(`${TAG} setTorchMode ON success`);
              }
              mCameraManager.off('torchStatusChange', (err, TorchStatusInfo) => {
                if (err) {
                  console.info(TAG + "enter  tourchStatusChange fail" + err);
                  expect().assertFail();
                  done();
                }
              });
            }
          }
          done();
        } catch (error) {
          console.info(`${TAG} SUB_MULTIMEDIA_CAMERA_ON_TORCH_STATUS_CHANGE_0100 err` + JSON.stringify(error));
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ON_TORCH_STATUS_CHANGE_0200
     * @tc.name      : on 监听，手电筒更改模式OFF2AUTO
     * @tc.desc      : on 监听，手电筒更改模式OFF2AUTO
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_ON_TORCH_STATUS_CHANGE_0200', 2, async (done: Function) => {
      if (mCameraNum == 0) {
        console.info(`${TAG} SUB_MULTIMEDIA_CAMERA_ON_TORCH_STATUS_CHANGE_0200 FAILED with NoCamera`);
        expect().assertFail();
        done();
      } else {
        try {
          let isTorchSupportedStatus = mCameraManager.isTorchSupported();
          console.info(`${TAG} isTorchSupportedStatus: ${isTorchSupportedStatus}`);
          if (isTorchSupportedStatus) {
            let isTorchModeSupported = mCameraManager.isTorchModeSupported(camera.TorchMode.OFF);
            console.info(`${TAG} isTorchModeSupported: ${isTorchModeSupported}`);
            if (isTorchModeSupported) {
              mCameraManager.setTorchMode(camera.TorchMode.OFF);
              console.info(`${TAG} setTorchMode OFF success`);
              mCameraManager.on('torchStatusChange', (err, TorchStatusInfo) => {
                if (err) {
                  console.info(`${TAG} torchStatusChange err:` + JSON.stringify(err));
                  expect().assertFail();
                  done();
                }
                console.info(`${TAG} TorchStatusInfo.isTorchAvailable: ${TorchStatusInfo.isTorchAvailable}`);
                console.info(`${TAG} TorchStatusInfo.isTorchActive: ${TorchStatusInfo.isTorchActive}`);
                console.info(`${TAG} TorchStatusInfo.torchLevel: ${TorchStatusInfo.torchLevel}`);
              });
              isTorchModeSupported = mCameraManager.isTorchModeSupported(camera.TorchMode.AUTO);
              if (isTorchModeSupported) {
                mCameraManager.setTorchMode(camera.TorchMode.AUTO);
                console.info(`${TAG} setTorchMode ON success`);
              }
              mCameraManager.off('torchStatusChange', (err, TorchStatusInfo) => {
                if (err) {
                  console.info(TAG + "enter  tourchStatusChange fail" + err);
                  expect().assertFail();
                  done();
                }
              });
            }
          }
          done();
        } catch (error) {
          console.info(`${TAG} SUB_MULTIMEDIA_CAMERA_ON_TORCH_STATUS_CHANGE_0200 err` + JSON.stringify(error));
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ON_TORCH_STATUS_CHANGE_0300
     * @tc.name      : on 监听，手电筒更改模式ON2OFF
     * @tc.desc      : on 监听，手电筒更改模式ON2OFF
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_ON_TORCH_STATUS_CHANGE_0300', 2, async (done: Function) => {
      if (mCameraNum == 0) {
        console.info(`${TAG} SUB_MULTIMEDIA_CAMERA_ON_TORCH_STATUS_CHANGE_0300 FAILED with NoCamera`);
        expect().assertFail();
        done();
      } else {
        try {
          let isTorchSupportedStatus = mCameraManager.isTorchSupported();
          console.info(`${TAG} isTorchSupportedStatus: ${isTorchSupportedStatus}`);
          if (isTorchSupportedStatus) {
            let isTorchModeSupported = mCameraManager.isTorchModeSupported(camera.TorchMode.ON);
            console.info(`${TAG} isTorchModeSupported: ${isTorchModeSupported}`);
            if (isTorchModeSupported) {
              mCameraManager.setTorchMode(camera.TorchMode.ON);
              console.info(`${TAG} setTorchMode OFF success`);
              mCameraManager.on('torchStatusChange', (err, TorchStatusInfo) => {
                if (err) {
                  console.info(`${TAG} torchStatusChange err:` + JSON.stringify(err));
                  expect().assertFail();
                  done();
                }
                console.info(`${TAG} TorchStatusInfo.isTorchAvailable: ${TorchStatusInfo.isTorchAvailable}`);
                console.info(`${TAG} TorchStatusInfo.isTorchActive: ${TorchStatusInfo.isTorchActive}`);
                console.info(`${TAG} TorchStatusInfo.torchLevel: ${TorchStatusInfo.torchLevel}`);
              });
              isTorchModeSupported = mCameraManager.isTorchModeSupported(camera.TorchMode.OFF);
              if (isTorchModeSupported) {
                mCameraManager.setTorchMode(camera.TorchMode.OFF);
                console.info(`${TAG} setTorchMode ON success`);
              }
              mCameraManager.off('torchStatusChange', (err, TorchStatusInfo) => {
                if (err) {
                  console.info(TAG + "enter  tourchStatusChange fail" + err);
                  expect().assertFail();
                  done();
                }
              });
            }
          }
          done();
        } catch (error) {
          console.info(`${TAG} SUB_MULTIMEDIA_CAMERA_ON_TORCH_STATUS_CHANGE_0300 err` + JSON.stringify(error));
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ON_TORCH_STATUS_CHANGE_0400
     * @tc.name      : on 监听，手电筒更改模式ON2AUTO
     * @tc.desc      : on 监听，手电筒更改模式ON2AUTO
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_ON_TORCH_STATUS_CHANGE_0400', 2, async (done: Function) => {
      if (mCameraNum == 0) {
        console.info(`${TAG} SUB_MULTIMEDIA_CAMERA_ON_TORCH_STATUS_CHANGE_0400 FAILED with NoCamera`);
        expect().assertFail();
        done();
      } else {
        try {
          let isTorchSupportedStatus = mCameraManager.isTorchSupported();
          console.info(`${TAG} isTorchSupportedStatus: ${isTorchSupportedStatus}`);
          if (isTorchSupportedStatus) {
            let isTorchModeSupported = mCameraManager.isTorchModeSupported(camera.TorchMode.ON);
            console.info(`${TAG} isTorchModeSupported: ${isTorchModeSupported}`);
            if (isTorchModeSupported) {
              mCameraManager.setTorchMode(camera.TorchMode.ON);
              console.info(`${TAG} setTorchMode OFF success`);
              mCameraManager.on('torchStatusChange', (err, TorchStatusInfo) => {
                if (err) {
                  console.info(`${TAG} torchStatusChange err:` + JSON.stringify(err));
                  expect().assertFail();
                  done();
                }
                console.info(`${TAG} TorchStatusInfo.isTorchAvailable: ${TorchStatusInfo.isTorchAvailable}`);
                console.info(`${TAG} TorchStatusInfo.isTorchActive: ${TorchStatusInfo.isTorchActive}`);
                console.info(`${TAG} TorchStatusInfo.torchLevel: ${TorchStatusInfo.torchLevel}`);
              });
              isTorchModeSupported = mCameraManager.isTorchModeSupported(camera.TorchMode.AUTO);
              if (isTorchModeSupported) {
                mCameraManager.setTorchMode(camera.TorchMode.AUTO);
                console.info(`${TAG} setTorchMode ON success`);
              }
              mCameraManager.off('torchStatusChange', (err, TorchStatusInfo) => {
                if (err) {
                  console.info(TAG + "enter  tourchStatusChange fail" + err);
                  expect().assertFail();
                  done();
                }
              });
            }
          }
          done();
        } catch (error) {
          console.info(`${TAG} SUB_MULTIMEDIA_CAMERA_ON_TORCH_STATUS_CHANGE_0400 err` + JSON.stringify(error));
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ON_TORCH_STATUS_CHANGE_0500
     * @tc.name      : on 监听，手电筒更改模式AUTO2OFF
     * @tc.desc      : on 监听，手电筒更改模式AUTO2OFF
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_ON_TORCH_STATUS_CHANGE_0500', 2, async (done: Function) => {
      if (mCameraNum == 0) {
        console.info(`${TAG} SUB_MULTIMEDIA_CAMERA_ON_TORCH_STATUS_CHANGE_0500 FAILED with NoCamera`);
        expect().assertFail();
        done();
      } else {
        try {
          let isTorchSupportedStatus = mCameraManager.isTorchSupported();
          console.info(`${TAG} isTorchSupportedStatus: ${isTorchSupportedStatus}`);
          if (isTorchSupportedStatus) {
            let isTorchModeSupported = mCameraManager.isTorchModeSupported(camera.TorchMode.AUTO);
            console.info(`${TAG} isTorchModeSupported: ${isTorchModeSupported}`);
            if (isTorchModeSupported) {
              mCameraManager.setTorchMode(camera.TorchMode.AUTO);
              console.info(`${TAG} setTorchMode OFF success`);
              mCameraManager.on('torchStatusChange', (err, TorchStatusInfo) => {
                if (err) {
                  console.info(`${TAG} torchStatusChange err:` + JSON.stringify(err));
                  expect().assertFail();
                  done();
                }
                console.info(`${TAG} TorchStatusInfo.isTorchAvailable: ${TorchStatusInfo.isTorchAvailable}`);
                console.info(`${TAG} TorchStatusInfo.isTorchActive: ${TorchStatusInfo.isTorchActive}`);
                console.info(`${TAG} TorchStatusInfo.torchLevel: ${TorchStatusInfo.torchLevel}`);
              });
              isTorchModeSupported = mCameraManager.isTorchModeSupported(camera.TorchMode.OFF);
              if (isTorchModeSupported) {
                mCameraManager.setTorchMode(camera.TorchMode.OFF);
                console.info(`${TAG} setTorchMode ON success`);
              }
              mCameraManager.off('torchStatusChange', (err, TorchStatusInfo) => {
                if (err) {
                  console.info(TAG + "enter  tourchStatusChange fail" + err);
                  expect().assertFail();
                  done();
                }
              });
            }
          }
          done();
        } catch (error) {
          console.info(`${TAG} SUB_MULTIMEDIA_CAMERA_ON_TORCH_STATUS_CHANGE_0500 err` + JSON.stringify(error));
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ON_TORCH_STATUS_CHANGE_0600
     * @tc.name      : on 监听，手电筒更改模式AUTO2ON
     * @tc.desc      : on 监听，手电筒更改模式AUTO2ON
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_ON_TORCH_STATUS_CHANGE_0600', 2, async (done: Function) => {
      if (mCameraNum == 0) {
        console.info(`${TAG} SUB_MULTIMEDIA_CAMERA_ON_TORCH_STATUS_CHANGE_0600 FAILED with NoCamera`);
        expect().assertFail();
        done();
      } else {
        try {
          let isTorchSupportedStatus = mCameraManager.isTorchSupported();
          console.info(`${TAG} isTorchSupportedStatus: ${isTorchSupportedStatus}`);
          if (isTorchSupportedStatus) {
            let isTorchModeSupported = mCameraManager.isTorchModeSupported(camera.TorchMode.AUTO);
            console.info(`${TAG} isTorchModeSupported: ${isTorchModeSupported}`);
            if (isTorchModeSupported) {
              mCameraManager.setTorchMode(camera.TorchMode.AUTO);
              console.info(`${TAG} setTorchMode OFF success`);
              mCameraManager.on('torchStatusChange', (err, TorchStatusInfo) => {
                if (err) {
                  console.info(`${TAG} torchStatusChange err:` + JSON.stringify(err));
                  expect().assertFail();
                  done();
                }
                console.info(`${TAG} TorchStatusInfo.isTorchAvailable: ${TorchStatusInfo.isTorchAvailable}`);
                console.info(`${TAG} TorchStatusInfo.isTorchActive: ${TorchStatusInfo.isTorchActive}`);
                console.info(`${TAG} TorchStatusInfo.torchLevel: ${TorchStatusInfo.torchLevel}`);
              });
              isTorchModeSupported = mCameraManager.isTorchModeSupported(camera.TorchMode.ON);
              if (isTorchModeSupported) {
                mCameraManager.setTorchMode(camera.TorchMode.ON);
                console.info(`${TAG} setTorchMode ON success`);
              }
              mCameraManager.off('torchStatusChange', (err, TorchStatusInfo) => {
                if (err) {
                  console.info(TAG + "enter  tourchStatusChange fail" + err);
                  expect().assertFail();
                  done();
                }
              });
            }
          }
          done();
        } catch (error) {
          console.info(`${TAG} SUB_MULTIMEDIA_CAMERA_ON_TORCH_STATUS_CHANGE_0600 err` + JSON.stringify(error));
          expect().assertFail();
          done();
        }
      }
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_OFF_TORCH_STATUS_CHANGE_0100
     * @tc.name      : OFF torchStatusChange
     * @tc.desc      : OFF torchStatusChange after ON
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_OFF_TORCH_STATUS_CHANGE_0100', 2, async (done: Function) => {
      if (mCameraNum == 0) {
        console.info(`${TAG} SUB_MULTIMEDIA_CAMERA_OFF_TORCH_STATUS_CHANGE_0100 FAILED with NoCamera`);
        expect().assertFail();
        done();
      } else {
        try {
          let isTorchSupportedStatus = mCameraManager.isTorchSupported();
          console.info(`${TAG} isTorchSupportedStatus: ${isTorchSupportedStatus}`);
          if (isTorchSupportedStatus) {
            let isTorchModeSupported = mCameraManager.isTorchModeSupported(camera.TorchMode.AUTO);
            console.info(`${TAG} isTorchModeSupported: ${isTorchModeSupported}`);
            if (isTorchModeSupported) {
              mCameraManager.setTorchMode(camera.TorchMode.AUTO);
              console.info(`${TAG} setTorchMode OFF success`);
              mCameraManager.on('torchStatusChange', (err, TorchStatusInfo) => {
                expect().assertFail();
              });
              mCameraManager.off('torchStatusChange', (err, TorchStatusInfo) => {
                if (err) {
                  console.info(TAG + "enter  tourchStatusChange fail" + err);
                  expect().assertFail();
                  done();
                }
              });
              isTorchModeSupported = mCameraManager.isTorchModeSupported(camera.TorchMode.ON);
              if (isTorchModeSupported) {
                mCameraManager.setTorchMode(camera.TorchMode.ON);
                console.info(`${TAG} setTorchMode ON success`);
              }
            }
          }
          done();
        } catch (error) {
          console.info(`${TAG} SUB_MULTIMEDIA_CAMERA_OFF_TORCH_STATUS_CHANGE_0100 err` + JSON.stringify(error));
          expect().assertFail();
          done();
        }
      }
    })
  })
}
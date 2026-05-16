/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { Want, UIExtensionAbility, UIExtensionContentSession, common,
  EmbeddedUIExtensionAbility } from '@kit.AbilityKit';
import { BusinessError, commonEventManager } from '@kit.BasicServicesKit';

let TAG: string = 'UIExtensionContentSession UIExtAbility';
let caseTag: string = 'Sub_UIExtensionContentSession_errorCode_0100';

export default class UIExtensionProvider extends UIExtensionAbility {
  onCreate() {
    console.log(TAG, `onCreate`);
  }

  onForeground() {
    console.log(TAG, `onForeground`);
  }

  onBackground() {
    console.log(TAG, `onBackground`);
  }

  onDestroy() {
    console.log(TAG, `onDestroy`);
  }

  onSessionCreate(want: Want, session: UIExtensionContentSession) {
    caseTag = want.action
    TAG = caseTag
    console.log(`${caseTag} onSessionCreate, want: ${JSON.stringify(want)}}`);
    let storage: LocalStorage = new LocalStorage();
    storage.setOrCreate('session', session);

    if (want.action == 'Sub_UIExtensionContentSession_errorCode_0100') {
      try {
        session.loadContent(undefined);
        console.info(`${caseTag} session.loadContent success`);
        commonEventManager.publish('ACTS_TEST_DESTROY', function () {
          console.info(`${caseTag} publish ACTS_TEST_DESTROY`);
        });
      } catch (error) {
        console.error(`session.loadContent fail, error: ${JSON.stringify(error)}`);
        if (error.code == 401) {
          globalThis.errCode = error.code
          commonEventManager.publish('ACTS_TEST_DESTROY', {
            parameters: {
              'result':error?.code,
            }
          }, function () {
            console.info(`${caseTag} publish ACTS_TEST_DESTROY`);
            setTimeout(() => {
              session?.terminateSelf((err: BusinessError) => {
                if (err) {
                  console.error(`Failed to terminate self, code: ${err.code}, msg: ${err.message}`);
                  return;
                }
                console.info(`Successed in terminating self.`);
              });
            },500)
          });
        }
      }
    }
    if (want.action == 'Sub_UIExtensionContentSession_errorCode_0200') {
      try {
        session.loadContentByName(undefined);
        console.info('loadContentByName session.loadContentByName success');
        commonEventManager.publish('ACTS_TEST_DESTROY', function () {
          console.info(`${caseTag} publish ACTS_TEST_DESTROY`);
        });
      } catch (error) {
        console.error(`session.loadContentByName fail, error: ${JSON.stringify(error)}`);
        if (error.code == 401) {
          globalThis.errCode = error.code
          commonEventManager.publish('ACTS_TEST_DESTROY', {
            parameters: {
              'result':error?.code,
            }
          }, function () {
            console.info(`${caseTag} publish ACTS_TEST_DESTROY`);
            setTimeout(() => {
              session?.terminateSelf((err: BusinessError) => {
                if (err) {
                  console.error(`Failed to terminate self, code: ${err.code}, msg: ${err.message}`);
                  return;
                }
                console.info(`Successed in terminating self.`);
              });
            },500)
          });
        }
      }
    }
    if (want.action == 'Sub_UIExtensionContentSession_errorCode_0300') {
      try {
        session?.terminateSelfWithResult(undefined, (err: BusinessError) => {
          if (err) {
            console.error(`Failed to terminate self with result, code: ${err.code}, msg: ${err.message}`);
            return;
          }
          console.info(`Successed in terminateSelf with result.`);
          console.error(`Test case execution results do not match expected outcomes.`);
          commonEventManager.publish('ACTS_TEST_DESTROY', function () {
            console.info(`${caseTag} publish ACTS_TEST_DESTROY`);
          });
        });
      } catch (error) {
        console.error(`session.terminateSelfWithResult fail, error: ${JSON.stringify(error)}`);
        if (error.code == 401) {
          globalThis.errCode = error.code
          commonEventManager.publish('ACTS_TEST_DESTROY', {
            parameters: {
              'result':error?.code,
            }
          }, function () {
            console.info(`${caseTag} publish ACTS_TEST_DESTROY`);
            setTimeout(() => {
              session?.terminateSelf((err: BusinessError) => {
                if (err) {
                  console.error(`Failed to terminate self, code: ${err.code}, msg: ${err.message}`);
                  return;
                }
                console.info(`Successed in terminating self.`);
              });
            },500)
          });
        }
      }
    }
    if (want.action == 'Sub_UIExtensionContentSession_errorCode_0400') {
      try {
        session?.terminateSelfWithResult(undefined)
          .then(() => {
            console.info(`Successed in terminateSelf with result.`);
            console.error(`Test case execution results do not match expected outcomes.`);
            commonEventManager.publish('ACTS_TEST_DESTROY', function () {
              console.info(`${caseTag} publish ACTS_TEST_DESTROY`);
            });
          })
          .catch((err: BusinessError) => {
            console.error(`Failed to terminate self with result, code: ${err.code}, msg: ${err.message}`);
          });
      } catch (error) {
        console.error(`session.terminateSelfWithResult fail, error: ${JSON.stringify(error)}`);
        if (error.code == 401) {
          globalThis.errCode = error.code
          commonEventManager.publish('ACTS_TEST_DESTROY', {
            parameters: {
              'result':error?.code,
            }
          }, function () {
            console.info(`${caseTag} publish ACTS_TEST_DESTROY`);
            setTimeout(() => {
              session?.terminateSelf((err: BusinessError) => {
                if (err) {
                  console.error(`Failed to terminate self, code: ${err.code}, msg: ${err.message}`);
                  return;
                }
                console.info(`Successed in terminating self.`);
              });
            },500)
          });
        }
      }
    }
    if (want.action == 'Sub_UIExtensionContentSession_errorCode_0500') {
      try {
        session.setWindowPrivacyMode(undefined)
          .then(() => {
            console.info(`Successed in setting window to privacy mode.`);
            console.error(`Test case execution results do not match expected outcomes.`);
            commonEventManager.publish('ACTS_TEST_DESTROY', function () {
              console.info(`${caseTag} publish ACTS_TEST_DESTROY`);
            });
          })
          .catch((err: BusinessError) => {
            console.error(`Failed to set window to privacy mode, code: ${err.code}, msg: ${err.message}`);
          });
      } catch (error) {
        console.error(`session.setWindowPrivacyMode fail, error: ${JSON.stringify(error)}`);
        if (error.code == 401) {
          globalThis.errCode = error.code
          commonEventManager.publish('ACTS_TEST_DESTROY', {
            parameters: {
              'result':error?.code,
            }
          }, function () {
            console.info(`${caseTag} publish ACTS_TEST_DESTROY`);
            setTimeout(() => {
              session?.terminateSelf((err: BusinessError) => {
                if (err) {
                  console.error(`Failed to terminate self, code: ${err.code}, msg: ${err.message}`);
                  return;
                }
                console.info(`Successed in terminating self.`);
              });
            },500)
          });
        }
      }
    }
    if (want.action == 'Sub_UIExtensionContentSession_errorCode_0600') {
      try {
        session.setWindowPrivacyMode(undefined, (err: BusinessError) => {
          if (err) {
            console.error(`Failed to set window to privacy mode, code: ${err.code}, msg: ${err.message}`);
            return;
          }
          console.info(`Successed in setting window to privacy mode.`);
          console.error(`Test case execution results do not match expected outcomes.`);
          commonEventManager.publish('ACTS_TEST_DESTROY', function () {
            console.info(`${caseTag} publish ACTS_TEST_DESTROY`);
          });
        });
      } catch (error) {
        console.error(`session.setWindowPrivacyMode fail, error: ${JSON.stringify(error)}`);
        if (error.code == 401) {
          globalThis.errCode = error.code
          commonEventManager.publish('ACTS_TEST_DESTROY', {
            parameters: {
              'result':error?.code,
            }
          }, function () {
            console.info(`${caseTag} publish ACTS_TEST_DESTROY`);
            setTimeout(() => {
              session?.terminateSelf((err: BusinessError) => {
                if (err) {
                  console.error(`Failed to terminate self, code: ${err.code}, msg: ${err.message}`);
                  return;
                }
                console.info(`Successed in terminating self.`);
              });
            },500)
          });
        }
      }
    }
    if (want.action == 'Sub_UIExtensionContentSession_errorCode_0700') {
      let wantParams: Record<string, Object> = {
        'sceneType': 1
      };
      let abilityStartCallback: common.AbilityStartCallback = {
        onError: (code: number, name: string, message: string) => {
          console.error(`onError, code: ${code}, name: ${name}, msg: ${message}`);
        },
        onResult: (result: common.AbilityResult) => {
          console.info(`onResult, result: ${JSON.stringify(result)}`);
          console.error(`Test case execution results do not match expected outcomes.`);
          commonEventManager.publish('ACTS_TEST_DESTROY', function () {
            console.info(`${caseTag} publish ACTS_TEST_DESTROY`);
          });
        }
      };
      session.startAbilityByType('xxxxx', wantParams, abilityStartCallback, (err: BusinessError) => {
        if (err) {
          console.error(`Failed to startAbilityByType, code: ${err.code}, msg: ${err.message}`);
          if (err.code == 16000050) {
            globalThis.errCode = err.code
            commonEventManager.publish('ACTS_TEST_DESTROY', {
            parameters: {
              'result':err?.code,
            }
          }, function () {
              console.info(`${caseTag} publish ACTS_TEST_DESTROY`);
              setTimeout(() => {
                session?.terminateSelf((err: BusinessError) => {
                  if (err) {
                    console.error(`Failed to terminate self, code: ${err.code}, msg: ${err.message}`);
                    return;
                  }
                  console.info(`Successed in terminating self.`);
                });
              },500)
            });
          }
        }
        console.info(`Successed in startAbilityByType`);
      });
    }
    if (want.action == 'Sub_UIExtensionContentSession_errorCode_0800') {
      let wantParams: Record<string, Object> = {
        'sceneType': 1
      };
      let abilityStartCallback: common.AbilityStartCallback = {
        onError: (code: number, name: string, message: string) => {
          console.error(`onError, code: ${code}, name: ${name}, msg: ${message}`);
        },
        onResult: (result: common.AbilityResult) => {
          console.info(`onResult, result: ${JSON.stringify(result)}`);
          console.error(`Test case execution results do not match expected outcomes.`);
        }
      };
      session.startAbilityByType('xxxxxx', wantParams, abilityStartCallback)
        .then(() => {
          console.info(`Successed in startAbilityByType`);
        })
        .catch((err: BusinessError) => {
          console.error(`Failed to startAbilityByType, code: ${err.code}, msg: ${err.message}`);
          if (err.code == 16000050) {
            globalThis.errCode = err.code
            commonEventManager.publish('ACTS_TEST_DESTROY', {
            parameters: {
              'result':err?.code,
            }
          }, function () {
              console.info(`${caseTag} publish ACTS_TEST_DESTROY`);
              setTimeout(() => {
                session?.terminateSelf((err: BusinessError) => {
                  if (err) {
                    console.error(`Failed to terminate self, code: ${err.code}, msg: ${err.message}`);
                    return;
                  }
                  console.info(`Successed in terminating self.`);
                });
              },500)
            });
          }
        });
    }
  }

  onSessionDestroy(session: UIExtensionContentSession) {
    console.log(TAG, `onSessionDestroy`);
  }
}
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
    if (want.action == 'Sub_UIExtensionContentSession_errorCode_0900') {
      try {
        session?.terminateSelfWithResult(null, (err: BusinessError) => {
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
    if (want.action == 'Sub_UIExtensionContentSession_errorCode_1000') {
      try {
        session?.terminateSelfWithResult(null)
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
    // errorCode_01100 - startAbilityByType type is null callback
    if (want.action == 'Sub_UIExtensionContentSession_errorCode_1100') {
      let wantParams: Record<string, Object> = {
        'sceneType': 1
      };
      let abilityStartCallback: common.AbilityStartCallback = {
        onError: (code: number, name: string, message: string) => {
          console.error(`onError, code: ${code}, name: ${name}, msg: ${message}`);
        },
        onResult: (result: common.AbilityResult) => {
          console.info(`onResult, result: ${JSON.stringify(result)}`);
        }
      };
      try {
        session.startAbilityByType(null, wantParams, abilityStartCallback, (err: BusinessError) => {
          if (err) {
            console.error(`Failed to startAbilityByType, code: ${err.code}, msg: ${err.message}`);
            if (err.code == 401) {
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
            return;
          }
          console.info(`Successed in startAbilityByType`);
          console.error(`Test case execution results do not match expected outcomes.`);
          commonEventManager.publish('ACTS_TEST_DESTROY', function () {
            console.info(`${caseTag} publish ACTS_TEST_DESTROY`);
          });
        });
      } catch (error) {
        console.error(`startAbilityByType fail, error: ${JSON.stringify(error)}`);
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
    // errorCode_01200 - startAbilityByType type is undefined callback
    if (want.action == 'Sub_UIExtensionContentSession_errorCode_1200') {
      let wantParams: Record<string, Object> = {
        'sceneType': 1
      };
      let abilityStartCallback: common.AbilityStartCallback = {
        onError: (code: number, name: string, message: string) => {
          console.error(`onError, code: ${code}, name: ${name}, msg: ${message}`);
        },
        onResult: (result: common.AbilityResult) => {
          console.info(`onResult, result: ${JSON.stringify(result)}`);
        }
      };
      try {
        session.startAbilityByType(undefined, wantParams, abilityStartCallback, (err: BusinessError) => {
          if (err) {
            console.error(`Failed to startAbilityByType, code: ${err.code}, msg: ${err.message}`);
            if (err.code == 401) {
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
            return;
          }
          console.info(`Successed in startAbilityByType`);
          console.error(`Test case execution results do not match expected outcomes.`);
          commonEventManager.publish('ACTS_TEST_DESTROY', function () {
            console.info(`${caseTag} publish ACTS_TEST_DESTROY`);
          });
        });
      } catch (error) {
        console.error(`startAbilityByType fail, error: ${JSON.stringify(error)}`);
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
    // errorCode_01300 - startAbilityByType type is empty string callback
    if (want.action == 'Sub_UIExtensionContentSession_errorCode_1300') {
      let wantParams: Record<string, Object> = {
        'sceneType': 1
      };
      let abilityStartCallback: common.AbilityStartCallback = {
        onError: (code: number, name: string, message: string) => {
          console.error(`onError, code: ${code}, name: ${name}, msg: ${message}`);
        },
        onResult: (result: common.AbilityResult) => {
          console.info(`onResult, result: ${JSON.stringify(result)}`);
        }
      };
      try {
        session.startAbilityByType('', wantParams, abilityStartCallback, (err: BusinessError) => {
            console.error(`Failed to startAbilityByType, code: ${err.code}, msg: ${err.message}`);
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
        });
      } catch (error) {
        console.error(`startAbilityByType fail, error: ${JSON.stringify(error)}`);
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
    // errorCode_01400 - startAbilityByType wantParam is null callback
    if (want.action == 'Sub_UIExtensionContentSession_errorCode_1400') {
      let abilityStartCallback: common.AbilityStartCallback = {
        onError: (code: number, name: string, message: string) => {
          console.error(`onError, code: ${code}, name: ${name}, msg: ${message}`);
        },
        onResult: (result: common.AbilityResult) => {
          console.info(`onResult, result: ${JSON.stringify(result)}`);
        }
      };
      try {
        session.startAbilityByType('testType', null, abilityStartCallback, (err: BusinessError) => {
          if (err) {
            console.error(`Failed to startAbilityByType, code: ${err.code}, msg: ${err.message}`);
            if (err.code == 401) {
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
            return;
          }
          console.info(`Successed in startAbilityByType`);
          console.error(`Test case execution results do not match expected outcomes.`);
          commonEventManager.publish('ACTS_TEST_DESTROY', function () {
            console.info(`${caseTag} publish ACTS_TEST_DESTROY`);
          });
        });
      } catch (error) {
        console.error(`startAbilityByType fail, error: ${JSON.stringify(error)}`);
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
    // errorCode_01500 - startAbilityByType wantParam is undefined callback
    if (want.action == 'Sub_UIExtensionContentSession_errorCode_1500') {
      let abilityStartCallback: common.AbilityStartCallback = {
        onError: (code: number, name: string, message: string) => {
          console.error(`onError, code: ${code}, name: ${name}, msg: ${message}`);
        },
        onResult: (result: common.AbilityResult) => {
          console.info(`onResult, result: ${JSON.stringify(result)}`);
        }
      };
      try {
        session.startAbilityByType('testType', undefined, abilityStartCallback, (err: BusinessError) => {
          if (err) {
            console.error(`Failed to startAbilityByType, code: ${err.code}, msg: ${err.message}`);
            if (err.code == 401) {
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
            return;
          }
          console.info(`Successed in startAbilityByType`);
          console.error(`Test case execution results do not match expected outcomes.`);
          commonEventManager.publish('ACTS_TEST_DESTROY', function () {
            console.info(`${caseTag} publish ACTS_TEST_DESTROY`);
          });
        });
      } catch (error) {
        console.error(`startAbilityByType fail, error: ${JSON.stringify(error)}`);
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
    // errorCode_01600 - startAbilityByType abilityStartCallback is null callback
    if (want.action == 'Sub_UIExtensionContentSession_errorCode_1600') {
      let wantParams: Record<string, Object> = {
        'sceneType': 1
      };
      try {
        session.startAbilityByType('testType', wantParams, null, (err: BusinessError) => {
            console.error(`Failed to startAbilityByType, code: ${err.code}, msg: ${err.message}`);
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
        });
      } catch (error) {
        console.error(`startAbilityByType fail, error: ${JSON.stringify(error)}`);
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
    // errorCode_01700 - startAbilityByType abilityStartCallback is undefined callback
    if (want.action == 'Sub_UIExtensionContentSession_errorCode_1700') {
      let wantParams: Record<string, Object> = {
        'sceneType': 1
      };
      try {
        session.startAbilityByType('testType', wantParams, undefined, (err: BusinessError) => {
            console.error(`Failed to startAbilityByType, code: ${err.code}, msg: ${err.message}`);
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
          })
      } catch (error) {
        console.error(`startAbilityByType fail, error: ${JSON.stringify(error)}`);
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
    // errorCode_02000 - startAbilityByType type is null promise
    if (want.action == 'Sub_UIExtensionContentSession_errorCode_2000') {
      let wantParams: Record<string, Object> = {
        'sceneType': 1
      };
      let abilityStartCallback: common.AbilityStartCallback = {
        onError: (code: number, name: string, message: string) => {
          console.error(`onError, code: ${code}, name: ${name}, msg: ${message}`);
        },
        onResult: (result: common.AbilityResult) => {
          console.info(`onResult, result: ${JSON.stringify(result)}`);
        }
      };
      try {
        session.startAbilityByType(null, wantParams, abilityStartCallback)
          .then(() => {
            console.info(`Successed in startAbilityByType`);
            console.error(`Test case execution results do not match expected outcomes.`);
          })
          .catch((err: BusinessError) => {
            console.error(`Failed to startAbilityByType, code: ${err.code}, msg: ${err.message}`);
            if (err.code == 401) {
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
      } catch (error) {
        console.error(`startAbilityByType fail, error: ${JSON.stringify(error)}`);
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
    // errorCode_02100 - startAbilityByType type is undefined promise
    if (want.action == 'Sub_UIExtensionContentSession_errorCode_2100') {
      let wantParams: Record<string, Object> = {
        'sceneType': 1
      };
      let abilityStartCallback: common.AbilityStartCallback = {
        onError: (code: number, name: string, message: string) => {
          console.error(`onError, code: ${code}, name: ${name}, msg: ${message}`);
        },
        onResult: (result: common.AbilityResult) => {
          console.info(`onResult, result: ${JSON.stringify(result)}`);
        }
      };
      try {
        session.startAbilityByType(undefined, wantParams, abilityStartCallback)
          .then(() => {
            console.info(`Successed in startAbilityByType`);
            console.error(`Test case execution results do not match expected outcomes.`);
          })
          .catch((err: BusinessError) => {
            console.error(`Failed to startAbilityByType, code: ${err.code}, msg: ${err.message}`);
            if (err.code == 401) {
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
      } catch (error) {
        console.error(`startAbilityByType fail, error: ${JSON.stringify(error)}`);
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
    // errorCode_02200 - startAbilityByType type is empty string promise
    if (want.action == 'Sub_UIExtensionContentSession_errorCode_2200') {
      let wantParams: Record<string, Object> = {
        'sceneType': 1
      };
      let abilityStartCallback: common.AbilityStartCallback = {
        onError: (code: number, name: string, message: string) => {
          console.error(`onError, code: ${code}, name: ${name}, msg: ${message}`);
        },
        onResult: (result: common.AbilityResult) => {
          console.info(`onResult, result: ${JSON.stringify(result)}`);
        }
      };
      try {
        session.startAbilityByType('', wantParams, abilityStartCallback)
          .then(() => {
            console.info(`Successed in startAbilityByType`);
            console.error(`Test case execution results do not match expected outcomes.`);
          })
          .catch((err: BusinessError) => {
            console.error(`Failed to startAbilityByType, code: ${err.code}, msg: ${err.message}`);
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
          });
      } catch (error) {
        console.error(`startAbilityByType fail, error: ${JSON.stringify(error)}`);
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
    // errorCode_02300 - startAbilityByType wantParam is null promise
    if (want.action == 'Sub_UIExtensionContentSession_errorCode_2300') {
      let abilityStartCallback: common.AbilityStartCallback = {
        onError: (code: number, name: string, message: string) => {
          console.error(`onError, code: ${code}, name: ${name}, msg: ${message}`);
        },
        onResult: (result: common.AbilityResult) => {
          console.info(`onResult, result: ${JSON.stringify(result)}`);
        }
      };
      try {
        session.startAbilityByType('testType', null, abilityStartCallback)
          .then(() => {
            console.info(`Successed in startAbilityByType`);
            console.error(`Test case execution results do not match expected outcomes.`);
          })
          .catch((err: BusinessError) => {
            console.error(`Failed to startAbilityByType, code: ${err.code}, msg: ${err.message}`);
            if (err.code == 401) {
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
      } catch (error) {
        console.error(`startAbilityByType fail, error: ${JSON.stringify(error)}`);
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
    // errorCode_02400 - startAbilityByType wantParam is undefined promise
    if (want.action == 'Sub_UIExtensionContentSession_errorCode_2400') {
      let abilityStartCallback: common.AbilityStartCallback = {
        onError: (code: number, name: string, message: string) => {
          console.error(`onError, code: ${code}, name: ${name}, msg: ${message}`);
        },
        onResult: (result: common.AbilityResult) => {
          console.info(`onResult, result: ${JSON.stringify(result)}`);
        }
      };
      try {
        session.startAbilityByType('testType', undefined, abilityStartCallback)
          .then(() => {
            console.info(`Successed in startAbilityByType`);
            console.error(`Test case execution results do not match expected outcomes.`);
          })
          .catch((err: BusinessError) => {
            console.error(`Failed to startAbilityByType, code: ${err.code}, msg: ${err.message}`);
            if (err.code == 401) {
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
      } catch (error) {
        console.error(`startAbilityByType fail, error: ${JSON.stringify(error)}`);
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
    // errorCode_02500 - startAbilityByType abilityStartCallback is null promise
    if (want.action == 'Sub_UIExtensionContentSession_errorCode_2500') {
      let wantParams: Record<string, Object> = {
        'sceneType': 1
      };
      try {
        session.startAbilityByType('testType', wantParams, null)
          .then(() => {
            console.info(`Successed in startAbilityByType`);
            console.error(`Test case execution results do not match expected outcomes.`);
          })
          .catch((err: BusinessError) => {
            console.error(`Failed to startAbilityByType, code: ${err.code}, msg: ${err.message}`);
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
          });
      } catch (error) {
        console.error(`startAbilityByType fail, error: ${JSON.stringify(error)}`);
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
    // errorCode_02600 - startAbilityByType abilityStartCallback is undefined promise
    if (want.action == 'Sub_UIExtensionContentSession_errorCode_2600') {
      let wantParams: Record<string, Object> = {
        'sceneType': 1
      };
      try {
        session.startAbilityByType('testType', wantParams, undefined)
          .then(() => {
            console.info(`Successed in startAbilityByType`);
            console.error(`Test case execution results do not match expected outcomes.`);
          })
          .catch((err: BusinessError) => {
            console.error(`Failed to startAbilityByType, code: ${err.code}, msg: ${err.message}`);
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
          });
      } catch (error) {
        console.error(`startAbilityByType fail, error: ${JSON.stringify(error)}`);
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
  }

  onSessionDestroy(session: UIExtensionContentSession) {
    console.log(TAG, `onSessionDestroy`);
  }
}
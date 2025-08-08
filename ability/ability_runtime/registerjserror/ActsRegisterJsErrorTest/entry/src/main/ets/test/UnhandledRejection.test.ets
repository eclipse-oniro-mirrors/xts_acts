/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import errorManager from "@ohos.app.ability.errorManager"
import worker, { MessageEvents } from '@ohos.worker';

let sleep = (time: number) => {
  return new Promise<number>((resolve) => setTimeout(resolve, time));
}

const SLEEP_DURATION = 800;
const TIMEOUT_DUARATION = 300;

export default function unhandledRejectionTest() {
  describe('ActsUnhandledRejectionTest', () => {
    beforeEach(async () => {
      errorManager.off("unhandledRejection");
      await sleep(SLEEP_DURATION);
    })
    afterEach(async () => {
      errorManager.off("unhandledRejection");
      await sleep(SLEEP_DURATION);
    })

    /*
     * @tc.number: ACTS_Register_JsErrorCallback_UnhandledRejection_0100
     * @tc.name: JsError unhandled rejection callback enhancement
     * @tc.desc: When an error is thrown during the resolve process the error would be caught as an unhandled rejection.
     */
    it('ACTS_Register_JsErrorCallback_UnhandledRejection_0100', Level.LEVEL0, async (done: Function) => {
      let flag = false;
      let observer: errorManager.UnhandledRejectionObserver = (reason: Error) => {
        console.log("=====>ACTS_Register_JsErrorCallback_UnhandledRejection_0100<=====");
        flag = true;
        expect(reason.message).assertContain("ACTS_Register_JsErrorCallback_UnhandledRejection_0100_error");
      };

      errorManager.on('unhandledRejection', observer);
      new Promise<string>((res) => {
        res("resolved");
      }).then(() => {
        throw new Error("ACTS_Register_JsErrorCallback_UnhandledRejection_0100_error")
      });

      setTimeout(() => {
        if (!flag) {
          expect().assertFail();
        }
        done();
      }, TIMEOUT_DUARATION);
      await sleep(SLEEP_DURATION);
    })

    /*
     * @tc.number: ACTS_Register_JsErrorCallback_UnhandledRejection_0200
     * @tc.name: JsError unhandled rejection callback enhancement
     * @tc.desc: When a promise is rejected but does not get caught the promise would be caught as an unhandled rejection.
     */
    it('ACTS_Register_JsErrorCallback_UnhandledRejection_0200', Level.LEVEL0, async (done: Function) => {
      let flag = false;
      let observer: errorManager.UnhandledRejectionObserver = (reason: string) => {
        console.log("=====>ACTS_Register_JsErrorCallback_UnhandledRejection_0200<=====");
        flag = true;
        expect(reason).assertContain("ACTS_Register_JsErrorCallback_UnhandledRejection_0200_rejection");
      };

      errorManager.on('unhandledRejection', observer);
      new Promise<string>((res, rej) => {
        rej("ACTS_Register_JsErrorCallback_UnhandledRejection_0200_rejection");
      }).then(() => {
        throw new Error("ACTS_Register_JsErrorCallback_UnhandledRejection_0200_error")
      });

      setTimeout(() => {
        if (!flag) {
          expect().assertFail();
        }
        done();
      }, TIMEOUT_DUARATION);
      await sleep(SLEEP_DURATION);
    })

    /*
     * @tc.number: ACTS_Register_JsErrorCallback_UnhandledRejection_0300
     * @tc.name: JsError unhandled rejection callback enhancement
     * @tc.desc: When an error is thrown during the catch process the error would be caught as an unhandled rejection.
     */
    it('ACTS_Register_JsErrorCallback_UnhandledRejection_0300', Level.LEVEL0, async (done: Function) => {
      let flag = false;
      let observer: errorManager.UnhandledRejectionObserver = (reason: Error) => {
        console.log("=====>ACTS_Register_JsErrorCallback_UnhandledRejection_0300<=====");
        flag = true;
        expect(reason.message).assertContain("ACTS_Register_JsErrorCallback_UnhandledRejection_0300_unhandled_error");
      };

      errorManager.on('unhandledRejection', observer);
      new Promise<string>((res, rej) => {
        res("ACTS_Register_JsErrorCallback_UnhandledRejection_0300_resolved");
      }).then((s: string) => {
        expect(s).assertEqual("ACTS_Register_JsErrorCallback_UnhandledRejection_0300_resolved");
        throw new Error("ACTS_Register_JsErrorCallback_UnhandledRejection_0300_error")
      }).catch((e: Error) => {
        expect(e.message).assertContain("ACTS_Register_JsErrorCallback_UnhandledRejection_0300_error");
        throw new Error("ACTS_Register_JsErrorCallback_UnhandledRejection_0300_unhandled_error");
      });

      setTimeout(() => {
        if (!flag) {
          expect().assertFail();
        }
        done();
      }, TIMEOUT_DUARATION);
      await sleep(SLEEP_DURATION);
    })

    /*
     * @tc.number: ACTS_Register_JsErrorCallback_UnhandledRejection_0400
     * @tc.name: JsError unhandled rejection callback enhancement
     * @tc.desc: When an error is thrown during the catch process the error would be caught as an unhandled rejection.
     */
    it('ACTS_Register_JsErrorCallback_UnhandledRejection_0400', Level.LEVEL0, async (done: Function) => {
      let flag = false;
      let observer: errorManager.UnhandledRejectionObserver = (reason: Error) => {
        console.log("=====>ACTS_Register_JsErrorCallback_UnhandledRejection_0400<=====");
        flag = true;
        expect(reason.message).assertContain("ACTS_Register_JsErrorCallback_UnhandledRejection_0400_unhandled_error");
      };

      errorManager.on('unhandledRejection', observer);
      new Promise<string>((res, rej) => {
        rej("ACTS_Register_JsErrorCallback_UnhandledRejection_0400_rejected");
      }).then((s: string) => {
        throw new Error("ACTS_Register_JsErrorCallback_UnhandledRejection_0400_error")
      }).catch((s: string) => {
        expect(s).assertContain("ACTS_Register_JsErrorCallback_UnhandledRejection_0400_rejected");
        throw new Error("ACTS_Register_JsErrorCallback_UnhandledRejection_0400_unhandled_error");
      });

      setTimeout(() => {
        if (!flag) {
          expect().assertFail();
        }
        done();
      }, TIMEOUT_DUARATION);
      await sleep(SLEEP_DURATION);
    })

    /*
     * @tc.number: ACTS_Register_JsErrorCallback_UnhandledRejection_0500
     * @tc.name: JsError unhandled rejection callback enhancement
     * @tc.desc: When a promise is unresolved it would be caught as an unhandled rejection.
     */
    it('ACTS_Register_JsErrorCallback_UnhandledRejection_0500', Level.LEVEL0, async (done: Function) => {
      let flag = false;
      let observer: errorManager.UnhandledRejectionObserver = (reason: Error) => {
        console.log("=====>ACTS_Register_JsErrorCallback_UnhandledRejection_0500<=====");
        flag = true;
        expect(reason.message).assertContain("ACTS_Register_JsErrorCallback_UnhandledRejection_0500_error");
      };

      errorManager.on('unhandledRejection', observer);
      new Promise<string>(() => {
        throw new Error("ACTS_Register_JsErrorCallback_UnhandledRejection_0500_error");
      });

      setTimeout(() => {
        if (!flag) {
          expect().assertFail();
        }
        done();
      }, TIMEOUT_DUARATION);
      await sleep(SLEEP_DURATION);
    })

    /*
     * @tc.number: ACTS_Register_JsErrorCallback_UnhandledRejection_0600
     * @tc.name: JsError unhandled rejection callback enhancement
     * @tc.desc: When trying to register UnhandledRejectionObserver in worker thread.
     */
    it('ACTS_Register_JsErrorCallback_UnhandledRejection_0600', Level.LEVEL0, async (done: Function) => {
      let flag = false;
      console.log("=====>ACTS_Register_JsErrorCallback_UnhandledRejection_0600<=====");
      let threadWorker: worker.ThreadWorker;
      threadWorker = new worker.ThreadWorker('entry_test/ets/workers/workerTestRegisterObservers.ts');
      threadWorker.onmessage = (evt: MessageEvents) => {
        console.log("Worker_Main_Thread, onmessage: ", JSON.stringify(evt.data));
        expect(evt.data).assertEqual("WorkerThread");
        flag = true;
      }
      threadWorker.postMessage("InTest host to worker");

      setTimeout(() => {
        if (!flag) {
          expect().assertFail();
        }
        done();
      }, TIMEOUT_DUARATION);
      await sleep(SLEEP_DURATION);
    })

    /*
     * @tc.number: ACTS_Register_JsErrorCallback_UnhandledRejection_0800
     * @tc.name: JsError unhandled rejection callback enhancement
     * @tc.desc: Trying to register a null UnhandledRejectionObserver will end up with a 401 error.
     */
    it('ACTS_Register_JsErrorCallback_UnhandledRejection_0800', Level.LEVEL0, async (done: Function) => {
      console.log("=====>ACTS_Register_JsErrorCallback_UnhandledRejection_0800<=====");

      try {
        errorManager.on('unhandledRejection', null);
        expect().assertFail();
        done();
      } catch (e) {
        console.info("====>ACTS_Register_JsErrorCallback_UnhandledRejection_0800 catch " + JSON.stringify(e));
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /*
     * @tc.number: ACTS_Register_JsErrorCallback_UnhandledRejection_0900
     * @tc.name: JsError unhandled rejection callback enhancement
     * @tc.desc: When an error is thrown during the parsing process in try catch, it will be captured as an unhandled rejection.
     */
    it('ACTS_Register_JsErrorCallback_UnhandledRejection_0900', Level.LEVEL0, async (done: Function) => {
      console.log("=====>ACTS_Register_JsErrorCallback_UnhandledRejection_0900<=====");

      let flag = false;

      let errorObserver: errorManager.ErrorObserver = {
        onUnhandledException(errMsg: string) {
          expect().assertFail();
          done();
        },
        onException(err: Error) {
          expect().assertFail();
          done();
        }
      };

      let unhandledRejectionObserver: errorManager.UnhandledRejectionObserver = (reason: Error) => {
        flag = true;
        expect(reason.message).assertContain("ACTS_Register_JsErrorCallback_UnhandledRejection_0900_Error");
      };

      errorManager.on('unhandledRejection', unhandledRejectionObserver);
      errorManager.on('error', errorObserver);

      try {
        new Promise<void>((res) => {
          res();
        }).then(() => {
          throw new Error("ACTS_Register_JsErrorCallback_UnhandledRejection_0900_Error")
        });
      } catch (e) {
        expect().assertFail();
        done();
      }

      setTimeout(() => {
        expect(flag).assertTrue();
        done();
      }, TIMEOUT_DUARATION);

      await sleep(SLEEP_DURATION);
    })

    /*
     * @tc.number: ACTS_Register_JsErrorCallback_UnhandledRejection_1000
     * @tc.name: JsError unhandled rejection callback enhancement
     * @tc.desc: Construct promise nested promise 
     */
    it('ACTS_Register_JsErrorCallback_UnhandledRejection_1000', Level.LEVEL0, async (done: Function) => {
      console.log("=====>ACTS_Register_JsErrorCallback_UnhandledRejection_1000<=====");

      let flag = false;

      let errorObserver: errorManager.ErrorObserver = {
        onUnhandledException(errMsg: string) {
          expect().assertFail();
          done();
        },
        onException(err: Error) {
          expect().assertFail();
          done();
        }
      };

      let unhandledRejectionObserver: errorManager.UnhandledRejectionObserver = (reason: Error) => {
        flag = true;
        expect(reason.message).assertContain("ACTS_Register_JsErrorCallback_UnhandledRejection_1000_Error");
      };

      errorManager.on('unhandledRejection', unhandledRejectionObserver);
      errorManager.on('error', errorObserver);

      try {
        new Promise<void>((res) => {
          res();
        }).then(() => {
          new Promise<void>((res) => {
            res();
          }).then(() => {
            throw new Error("ACTS_Register_JsErrorCallback_UnhandledRejection_1000_Error");
          })
        });
      } catch (e) {
        expect().assertFail();
        done();
      }

      setTimeout(() => {
        expect(flag).assertTrue();
        done();
      }, TIMEOUT_DUARATION);

      await sleep(SLEEP_DURATION);
    })

    /*
     * @tc.number: ACTS_Unregister_JsErrorCallback_UnhandledRejection_0100
     * @tc.name: JsError unhandled rejection callback enhancement
     * @tc.desc: Trying to unregister a registered UnhandledRejectionObserver will succeed.
     */
    it('ACTS_Unregister_JsErrorCallback_UnhandledRejection_0100', Level.LEVEL0, async (done: Function) => {
      let oldObserver: errorManager.UnhandledRejectionObserver = () => {
        expect().assertFail();
      };

      errorManager.on('unhandledRejection', oldObserver);

      setTimeout(() => {
        errorManager.off("unhandledRejection", oldObserver)
      }, TIMEOUT_DUARATION);
      await sleep(SLEEP_DURATION);

      let flag = false;
      let newObserver: errorManager.UnhandledRejectionObserver = (reason: Error) => {
        console.log("=====>ACTS_Unregister_JsErrorCallback_UnhandledRejection_0100<=====");
        flag = true;
        expect(reason.message).assertContain("ACTS_Unregister_JsErrorCallback_UnhandledRejection_0100_error");
      };

      errorManager.on("unhandledRejection", newObserver);
      new Promise<string>((res, rej) => {
        res("ACTS_Unregister_JsErrorCallback_UnhandledRejection_0100_resolved");
      }).then((s: string) => {
        expect(s).assertContain("ACTS_Unregister_JsErrorCallback_UnhandledRejection_0100_resolved")
        throw new Error("ACTS_Unregister_JsErrorCallback_UnhandledRejection_0100_error")
      });

      setTimeout(() => {
        if (!flag) {
          expect().assertFail();
        }
        done();
      }, TIMEOUT_DUARATION);
      await sleep(SLEEP_DURATION);
    })

    /*
     * @tc.number: ACTS_Unregister_JsErrorCallback_UnhandledRejection_0200
     * @tc.name: JsError unhandled rejection callback enhancement
     * @tc.desc: Trying to unregister all registered UnhandledRejectionObservers will succeed.
     */
    it('ACTS_Unregister_JsErrorCallback_UnhandledRejection_0200', Level.LEVEL0, async (done: Function) => {
      let observer1: errorManager.UnhandledRejectionObserver = () => {
        expect().assertFail();
      };
      let observer2: errorManager.UnhandledRejectionObserver = () => {
        expect().assertFail();
      };
      let observer3: errorManager.UnhandledRejectionObserver = () => {
        expect().assertFail();
      };

      errorManager.on('unhandledRejection', observer1);
      errorManager.on('unhandledRejection', observer2);
      errorManager.on('unhandledRejection', observer3);

      setTimeout(() => {
        errorManager.off("unhandledRejection")
      }, TIMEOUT_DUARATION);
      await sleep(SLEEP_DURATION);

      let flag = false;
      let newObserver: errorManager.UnhandledRejectionObserver = (reason: Error) => {
        console.log("=====>ACTS_Unregister_JsErrorCallback_UnhandledRejection_0200<=====");
        flag = true;
        expect(reason.message).assertContain("ACTS_Unregister_JsErrorCallback_UnhandledRejection_0200_error");
      };

      errorManager.on("unhandledRejection", newObserver);
      new Promise<string>((res, rej) => {
        res("ACTS_Unregister_JsErrorCallback_UnhandledRejection_0200_resolved");
      }).then((s: string) => {
        expect(s).assertContain("ACTS_Unregister_JsErrorCallback_UnhandledRejection_0200_resolved")
        throw new Error("ACTS_Unregister_JsErrorCallback_UnhandledRejection_0200_error")
      });

      setTimeout(() => {
        if (!flag) {
          expect().assertFail();
        }
        done();
      }, TIMEOUT_DUARATION);
      await sleep(SLEEP_DURATION);
    })

    /*
     * @tc.number: ACTS_Unregister_JsErrorCallback_UnhandledRejection_0300
     * @tc.name: JsError unhandled rejection callback enhancement
     * @tc.desc: Trying to unregister an unregistered UnhandledRejectionObserver will end up with a 16300004 error.
     */
    it('ACTS_Unregister_JsErrorCallback_UnhandledRejection_0300', Level.LEVEL0, async (done: Function) => {
      let unregisteredObserver: errorManager.UnhandledRejectionObserver = () => {
        console.log("THIS SHOULD NEVER SHOW UP");
      }
      try {
        errorManager.off('unhandledRejection', unregisteredObserver);
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(16300004);
      }

      setTimeout(() => {
        done();
      }, TIMEOUT_DUARATION);
      await sleep(SLEEP_DURATION);
    })

    /*
     * @tc.number: ACTS_Unregister_JsErrorCallback_UnhandledRejection_0400
     * @tc.name: JsError unhandled rejection callback enhancement
     * @tc.desc: Trying to unregister a null UnhandledRejectionObserver will end up with a 401 error.
     */
    it('ACTS_Unregister_JsErrorCallback_UnhandledRejection_0400', Level.LEVEL0, async (done: Function) => {
      console.log("=====>ACTS_Unregister_JsErrorCallback_UnhandledRejection_0400<=====");
      try {
        errorManager.off('unhandledRejection', null);
        expect().assertFail();
        done();
      } catch (e) {
        console.info("====>ACTS_Unregister_JsErrorCallback_UnhandledRejection_0400 catch " + JSON.stringify(e));
        expect(e.code).assertEqual(401);
        done();
      }

      setTimeout(() => {
        done();
      }, TIMEOUT_DUARATION);
      await sleep(SLEEP_DURATION);
    })

    /*
     * @tc.number: ACTS_Unregister_JsErrorCallback_UnhandledRejection_0500
     * @tc.name: JsError unhandled rejection callback enhancement
     * @tc.desc: Trying to unregister UnhandledRejectionObserver in worker.
     */
    it('ACTS_Unregister_JsErrorCallback_UnhandledRejection_0500', Level.LEVEL0, async (done) => {
      let flag = false;
      console.log("=====>ACTS_Unregister_JsErrorCallback_UnhandledRejection_0500<=====");

      let observer: errorManager.UnhandledRejectionObserver = () => {
        console.log("THIS SHOULD NEVER SHOW UP");
      };

      errorManager.on('unhandledRejection', observer);

      let threadWorker: worker.ThreadWorker;
      threadWorker = new worker.ThreadWorker('entry_test/ets/workers/workerTestUnregisterObservers.ts');
      threadWorker.onmessage = (evt: MessageEvents) => {
        console.log("Worker_Main_Thread, onmessage: ", JSON.stringify(evt.data));
        expect(evt.data).assertEqual("WorkerThread");
        flag = true;
      }
      threadWorker.postMessage("InTest host to worker");
      await sleep(SLEEP_DURATION);

      setTimeout(() => {
        if (!flag) {
          expect().assertFail();
        }
        done();
      }, SLEEP_DURATION);

      await sleep(SLEEP_DURATION);
    })
  })
}
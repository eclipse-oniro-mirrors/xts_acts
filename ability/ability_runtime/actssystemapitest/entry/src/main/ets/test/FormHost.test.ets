/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import { describe, it, expect } from '@ohos/hypium'
import formHost from '@ohos.app.form.formHost'

let ERROR_CODE = 202;
export default function formHostTest() {
  describe('formHostTest', function () {

    /**
     * @tc.number: System_API_Test_Form_Host_0100
     * @tc.name: callback form deleteForm system interface interception test
     * @tc.desc:  Test the third-party application call deleteForm will be blocked
     * @tc.level   3
     */
    it('System_API_Test_Form_Host_0100',0, async function (done) {
      let TAG = 'System_API_Test_Form_Host_0100';
      console.log(TAG + ' formHost deleteForm BEGIN');
      try {
        let formId = "12400633174999288";
        formHost.deleteForm(formId, (error, data) => {
          if (error) {
            console.log(TAG + ' formHost deleteForm, error:' + JSON.stringify(error.code));
            expect(error.code).assertEqual(ERROR_CODE);
            done();
          } else {
            console.log(TAG + ' formHost deleteForm success');
          }
        });
      } catch (error) {
        console.log(`catch err->${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ERROR_CODE);
        done();
      }
    })

    /**
     * @tc.number: System_API_Test_Form_Host_0200
     * @tc.name: promise form deleteForm system interface interception test
     * @tc.desc:  Test the third-party application call deleteForm will be blocked
     * @tc.level   3
     */
    it('System_API_Test_Form_Host_0200',0, async function (done) {
      let TAG = 'System_API_Test_Form_Host_0200';
      try {
        let formId = "12400633174999288";
        formHost.deleteForm(formId)
          .then(() => {
            expect().assertFail();
            done();
          })
          .catch((error) => {
            console.log(TAG + ' formHost deleteForm, error:' + JSON.stringify(error));
            expect(error.code).assertEqual(ERROR_CODE);
            done();
          })
      } catch (error) {
        console.log(`catch err->${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ERROR_CODE);
        done();
      }
    })

    

    /**
     * @tc.number: System_API_Test_Form_Host_0300
     * @tc.name: callback form deleteForm system interface interception test
     * @tc.desc:  Test the third-party application call deleteForm will be blocked
     * @tc.level   3
     */
    it('System_API_Test_Form_Host_0300',0, async function (done) {
      let TAG = 'System_API_Test_Form_Host_0300';
      try {
        let formId = "12400633174999288";
        formHost.releaseForm(formId, (error, data) => {
          if (error) {
            console.log(TAG + ' formHost releaseForm, error:' + JSON.stringify(error));
            expect(error.code).assertEqual(ERROR_CODE);
            done();
          } else {
            console.log(TAG + ' formHost releaseForm success');
          }
        });
      } catch (error) {
        console.log(`catch err->${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ERROR_CODE);
        done();
      }
    })

    /**
     * @tc.number: System_API_Test_Form_Host_0400
     * @tc.name: Multi-parameter releaseForm system interface interception test in the form of callback
     * @tc.desc:  Test the third-party application call releaseForm will be blocked
     * @tc.level   3
     */
    it('System_API_Test_Form_Host_0400',0, async function (done) {
      let TAG = 'System_API_Test_Form_Host_0400';
      try {
        let formId = "12400633174999288";
        formHost.releaseForm(formId, false, (error, data) => {
          if (error) {
            console.log(TAG + ' formHost releaseForm, error:' + JSON.stringify(error));
            expect(error.code).assertEqual(ERROR_CODE);
            done();
          } else {
            console.log(TAG + ' formHost releaseForm success');
          }
        });
      } catch (error) {
        console.log(`catch err->${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ERROR_CODE);
        done();
      }
    })

    /**
     * @tc.number: System_API_Test_Form_Host_0500
     * @tc.name: promise form releaseForm system interface interception test
     * @tc.desc:  Test the third-party application call releaseForm will be blocked
     * @tc.level   3
     */
    it('System_API_Test_Form_Host_0500',0, async function (done) {
      let TAG = 'System_API_Test_Form_Host_0500';
      try {
        let formId = "12400633174999288";
        formHost.releaseForm(formId)
          .then(() => {
            expect().assertFail();
            done();
          })
          .catch((error) => {
            console.log(TAG + ' formHost releaseForm, error:' + JSON.stringify(error));
            expect(error.code).assertEqual(ERROR_CODE);
            done();
          })
      } catch (error) {
        console.log(`catch err->${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ERROR_CODE);
        done();
      }
    })

    /**
     * @tc.number: System_API_Test_Form_Host_0600
     * @tc.name: callback form requestForm system interface interception test
     * @tc.desc:  Test the third-party application call requestForm will be blocked
     * @tc.level   3
     */
    it('System_API_Test_Form_Host_0600',0, async function (done) {
      let TAG = 'System_API_Test_Form_Host_0600';
      try {
        let formId = "12400633174999288";
        formHost.requestForm(formId, (error, data) => {
          if (error) {
            console.log(TAG + ' formHost requestForm, error:' + JSON.stringify(error));
            expect(error.code).assertEqual(ERROR_CODE);
            done();
          } else {
            console.log(TAG + ' formHost requestForm success');
          }
        });
      } catch (error) {
        console.log(`catch err->${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ERROR_CODE);
        done();
      }
    })

    /**
     * @tc.number: System_API_Test_Form_Host_0700
     * @tc.name: promise form requestForm system interface interception test
     * @tc.desc:  Test the third-party application call requestForm will be blocked
     * @tc.level   3
     */
    it('System_API_Test_Form_Host_0700',0, async function (done) {
      let TAG = 'System_API_Test_Form_Host_0700';
      try {
        let formId = "12400633174999288";
        formHost.requestForm(formId)
          .then(() => {
            expect().assertFail();
            done();
          })
          .catch((error) => {
            console.log(TAG + ' formHost requestForm, error:' + JSON.stringify(error));
            expect(error.code).assertEqual(ERROR_CODE);
            done();
          })
      } catch (error) {
        console.log(`catch err->${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ERROR_CODE);
        done();
      }
    })

    /**
     * @tc.number: System_API_Test_Form_Host_0800
     * @tc.name: callback form castToNormalForm system interface interception test
     * @tc.desc:  Test the third-party application call castToNormalForm will be blocked
     * @tc.level   3
     */
    it('System_API_Test_Form_Host_0800',0, async function (done) {
      let TAG = 'System_API_Test_Form_Host_0800';
      try {
        let formId = "12400633174999288";
        formHost.castToNormalForm(formId, (error, data) => {
          if (error) {
            console.log(TAG + ' formHost castToNormalForm, error:' + JSON.stringify(error));
            expect(error.code).assertEqual(ERROR_CODE);
            done();
          } else {
            console.log(TAG + ' formHost castToNormalForm success');
          }
        });
      } catch (error) {
        console.log(`catch err->${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ERROR_CODE);
        done();
      }
    })

    /**
     * @tc.number: System_API_Test_Form_Host_0900
     * @tc.name: promise form castToNormalForm system interface interception test
     * @tc.desc:  Test the third-party application call castToNormalForm will be blocked
     * @tc.level   3
     */
    it('System_API_Test_Form_Host_0900',0, async function (done) {
      let TAG = 'System_API_Test_Form_Host_0900';
      try {
        let formId = "12400633174999288";
        formHost.castToNormalForm(formId)
          .then(() => {
            expect().assertFail();
            done();
          })
          .catch((error) => {
            console.log(TAG + ' formHost castToNormalForm, error:' + JSON.stringify(error));
            expect(error.code).assertEqual(ERROR_CODE);
            done();
          })
      } catch (error) {
        console.log(`catch err->${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ERROR_CODE);
        done();
      }
    })

    /**
     * @tc.number: System_API_Test_Form_Host_1000
     * @tc.name: callback form notifyVisibleForms system interface interception test
     * @tc.desc:  Test the third-party application call notifyVisibleForms will be blocked
     * @tc.level   3
     */
    it('System_API_Test_Form_Host_1000',0, async function (done) {
      let TAG = 'System_API_Test_Form_Host_1000';
      try {
        let formId = "12400633174999288";
        formHost.notifyVisibleForms([formId], (error, data) => {
          if (error) {
            console.log(TAG + ' formHost castToNormalForm, error:' + JSON.stringify(error));
            expect(error.code).assertEqual(ERROR_CODE);
            done();
          } else {
            console.log(TAG + ' formHost castToNormalForm success');
          }
        });
      } catch (error) {
        console.log(`catch err->${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ERROR_CODE);
        done();
      }
    })

    /**
     * @tc.number: System_API_Test_Form_Host_1100
     * @tc.name: promise form notifyVisibleForms system interface interception test
     * @tc.desc:  Test the third-party application call notifyVisibleForms will be blocked
     * @tc.level   3
     */
    it('System_API_Test_Form_Host_1100',0, async function (done) {
      let TAG = 'System_API_Test_Form_Host_1100';
      try {
        let formId = "12400633174999288";
        formHost.notifyVisibleForms([formId])
          .then(() => {
            expect().assertFail();
            done();
          })
          .catch((error) => {
            console.log(TAG + ' formHost castToNormalForm, error:' + JSON.stringify(error));
            expect(error.code).assertEqual(ERROR_CODE);
            done();
          })
      } catch (error) {
        console.log(`catch err->${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ERROR_CODE);
        done();
      }
    })

    /**
     * @tc.number: System_API_Test_Form_Host_1200
     * @tc.name: callback form notifyInvisibleForms system interface interception test
     * @tc.desc:  Test the third-party application call notifyInvisibleForms will be blocked
     * @tc.level   3
     */
    it('System_API_Test_Form_Host_1200',0, async function (done) {
      let TAG = 'System_API_Test_Form_Host_1200';
      try {
        let formId = "12400633174999288";
        formHost.notifyInvisibleForms([formId], (error, data) => {
          if (error) {
            console.log(TAG + ' formHost notifyInvisibleForms, error:' + JSON.stringify(error));
            expect(error.code).assertEqual(ERROR_CODE);
            done();
          } else {
            console.log(TAG + ' formHost notifyInvisibleForms success');
          }
        });
      } catch (error) {
        console.log(`catch err->${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ERROR_CODE);
        done();
      }
    })

    /**
     * @tc.number: System_API_Test_Form_Host_1300
     * @tc.name: promise form notifyInvisibleForms system interface interception test
     * @tc.desc:  Test the third-party application call notifyInvisibleForms will be blocked
     * @tc.level   3
     */
    it('System_API_Test_Form_Host_1300',0, async function (done) {
      let TAG = 'System_API_Test_Form_Host_1300';
      try {
        let formId = "12400633174999288";
        formHost.notifyInvisibleForms([formId])
          .then(() => {
            expect().assertFail();
            done();
          })
          .catch((error) => {
            console.log(TAG + ' formHost notifyInvisibleForms, error:' + JSON.stringify(error));
            expect(error.code).assertEqual(ERROR_CODE);
            done();
          })
      } catch (error) {
        console.log(`catch err->${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ERROR_CODE);
        done();
      }
    })

    /**
     * @tc.number: System_API_Test_Form_Host_1400
     * @tc.name: callback form enableFormsUpdate system interface interception test
     * @tc.desc:  Test the third-party application call enableFormsUpdate will be blocked
     * @tc.level   3
     */
    it('System_API_Test_Form_Host_1400',0, async function (done) {
      let TAG = 'System_API_Test_Form_Host_1400';
      try {
        let formId = "12400633174999288";
        formHost.enableFormsUpdate([formId], (error, data) => {
          if (error) {
            console.log(TAG + ' formHost enableFormsUpdate, error:' + JSON.stringify(error));
            expect(error.code).assertEqual(ERROR_CODE);
            done();
          } else {
            console.log(TAG + ' formHost enableFormsUpdate success');
          }
        });
      } catch (error) {
        console.log(`catch err->${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ERROR_CODE);
        done();
      }
    })

    /**
     * @tc.number: System_API_Test_Form_Host_1500
     * @tc.name: promise form enableFormsUpdate system interface interception test
     * @tc.desc:  Test the third-party application call enableFormsUpdate will be blocked
     * @tc.level   3
     */
    it('System_API_Test_Form_Host_1500',0, async function (done) {
      let TAG = 'System_API_Test_Form_Host_1500';
      try {
        let formId = "12400633174999288";
        formHost.enableFormsUpdate([formId])
          .then(() => {
            expect().assertFail();
            done();
          })
          .catch((error) => {
            console.log(TAG + ' formHost enableFormsUpdate, error:' + JSON.stringify(error));
            expect(error.code).assertEqual(ERROR_CODE);
            done();
          })
      } catch (error) {
        console.log(`catch err->${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ERROR_CODE);
        done();
      }
    })

    /**
     * @tc.number: System_API_Test_Form_Host_1600
     * @tc.name: callback form disableFormsUpdate system interface interception test
     * @tc.desc:  Test the third-party application call disableFormsUpdate will be blocked
     * @tc.level   3
     */
    it('System_API_Test_Form_Host_1600',0, async function (done) {
      let TAG = 'System_API_Test_Form_Host_1600';
      try {
        let formId = "12400633174999288";
        formHost.disableFormsUpdate([formId], (error, data) => {
          if (error) {
            console.log(TAG + ' formHost disableFormsUpdate, error:' + JSON.stringify(error));
            expect(error.code).assertEqual(ERROR_CODE);
            done();
          } else {
            console.log(TAG + ' formHost disableFormsUpdate success');
          }
        });
      } catch (error) {
        console.log(`catch err->${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ERROR_CODE);
        done();
      }
    })

    /**
     * @tc.number: System_API_Test_Form_Host_1700
     * @tc.name: promise form disableFormsUpdate system interface interception test
     * @tc.desc:  Test the third-party application call disableFormsUpdate will be blocked
     * @tc.level   3
     */
    it('System_API_Test_Form_Host_1700',0, async function (done) {
      let TAG = 'System_API_Test_Form_Host_1700';
      try {
        let formId = "12400633174999288";
        formHost.disableFormsUpdate([formId])
          .then(() => {
            expect().assertFail();
            done();
          })
          .catch((error) => {
            console.log(TAG + ' formHost disableFormsUpdate, error:' + JSON.stringify(error));
            expect(error.code).assertEqual(ERROR_CODE);
            done();
          })
      } catch (error) {
        console.log(`catch err->${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ERROR_CODE);
        done();
      }
    })

    /**
     * @tc.number: System_API_Test_Form_Host_1800
     * @tc.name: callback form isSystemReady system interface interception test
     * @tc.desc:  Test the third-party application call isSystemReady will be blocked
     * @tc.level   3
     */
    it('System_API_Test_Form_Host_1800',0, async function (done) {
      let TAG = 'System_API_Test_Form_Host_1800';
      try {
        formHost.isSystemReady((data) => {

        })
      } catch (error) {
        console.log(TAG + ` catch err->${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ERROR_CODE);
        done();
      }
    })

    /**
     * @tc.number: System_API_Test_Form_Host_1900
     * @tc.name: promise form isSystemReady system interface interception test
     * @tc.desc:  Test the third-party application call isSystemReady will be blocked
     * @tc.level   3
     */
    it('System_API_Test_Form_Host_1900',0, async function (done) {
      let TAG = 'System_API_Test_Form_Host_1900';
      try {
        formHost.isSystemReady()
          .then(() => {
            expect().assertFail();
            done();
          })
          .catch((error) => {
            console.log(TAG + ` promise catch err->${JSON.stringify(error)}`);
          })
      } catch (error) {
        console.log(TAG + ` catch err->${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ERROR_CODE);
        done();
      }
    })

    /**
     * @tc.number: System_API_Test_Form_Host_2000
     * @tc.name: callback form getAllFormsInfo system interface interception test
     * @tc.desc:  Test the third-party application call getAllFormsInfo will be blocked
     * @tc.level   3
     */
    it('System_API_Test_Form_Host_2000',0, async function (done) {
      let TAG = 'System_API_Test_Form_Host_2000';
      try {
        formHost.getAllFormsInfo((error, data) => {
          console.log(TAG + ' formHost getAllFormsInfo, error:' + JSON.stringify(error));
          expect(error.code).assertEqual(ERROR_CODE);
          done();
        })
      } catch (error) {
        console.log(TAG + ` catch err->${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ERROR_CODE);
        done();
      }
    })

    /**
     * @tc.number: System_API_Test_Form_Host_2100
     * @tc.name: promise form getAllFormsInfo system interface interception test
     * @tc.desc:  Test the third-party application call getAllFormsInfo will be blocked
     * @tc.level   3
     */
    it('System_API_Test_Form_Host_2100',0, async function (done) {
      let TAG = 'System_API_Test_Form_Host_2100';
      try {
        formHost.getAllFormsInfo()
          .then(() => {
            expect().assertFail();
            done();
           })
          .catch((error) => {
            console.log(TAG + ' formHost getAllFormsInfo, error:' + JSON.stringify(error));
            expect(error.code).assertEqual(ERROR_CODE);
            done();
          })
      } catch (error) {
        console.log(TAG + ` catch err->${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ERROR_CODE);
        done();
      }
    })

    
    /**
     * @tc.number: System_API_Test_Form_Host_2200
     * @tc.name: callback form getFormsInfo system interface interception test
     * @tc.desc:  Test the third-party application call getFormsInfo will be blocked
     * @tc.level   3
     */
    it('System_API_Test_Form_Host_2200',0, async function (done) {
      let TAG = 'System_API_Test_Form_Host_2200';
      try {
        let bundleName = "bundleName";
        formHost.getFormsInfo(bundleName, (error, data) => {
          if (error) {
            console.log(TAG + ' formHost getFormsInfo, error:' + JSON.stringify(error));
            expect(error.code).assertEqual(ERROR_CODE);
            done();
          } else {
            console.log(TAG + ' formHost getFormsInfo success');
          }
        });
      } catch (error) {
        console.log(`catch err->${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ERROR_CODE);
        done();
      }
    })

    /**
     * @tc.number: System_API_Test_Form_Host_2300
     * @tc.name: Multiple input in the form of callback getFormsInfo system interface interception test
     * @tc.desc:  Test the third-party application call getFormsInfo will be blocked
     * @tc.level   3
     */
    it('System_API_Test_Form_Host_2300',0, async function (done) {
      let TAG = 'System_API_Test_Form_Host_2300';
      try {
        let bundleName = "bundleName";
        let moduleName = "moduleName";
        formHost.getFormsInfo(bundleName, moduleName, (error, data) => {
          if (error) {
            console.log(TAG + ' formHost getFormsInfo, error:' + JSON.stringify(error));
            expect(error.code).assertEqual(ERROR_CODE);
            done();
          } else {
            console.log(TAG + ' formHost getFormsInfo success');
          }
        });
      } catch (error) {
        console.log(`catch err->${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ERROR_CODE);
        done();
      }
    })

    /**
     * @tc.number: System_API_Test_Form_Host_2400
     * @tc.name: promise form getFormsInfo system interface interception test
     * @tc.desc:  Test the third-party application call getFormsInfo will be blocked
     * @tc.level   3
     */
    it('System_API_Test_Form_Host_2400',0, async function (done) {
      let TAG = 'System_API_Test_Form_Host_2400';
      try {
        let bundleName = "bundleName";
        formHost.getFormsInfo(bundleName)
          .then(() => {
            expect().assertFail();
            done();
          })
          .catch((error) => {
            console.log(TAG + ' formHost getFormsInfo, error:' + JSON.stringify(error));
            expect(error.code).assertEqual(ERROR_CODE);
            done();
          })
      } catch (error) {
        console.log(`catch err->${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ERROR_CODE);
        done();
      }
    })

    /**
     * @tc.number: System_API_Test_Form_Host_2500
     * @tc.name: callback form deleteInvalidForms system interface interception test
     * @tc.desc:  Test the third-party application call deleteInvalidForms will be blocked
     * @tc.level   3
     */
    it('System_API_Test_Form_Host_2500',0, async function (done) {
      let TAG = 'System_API_Test_Form_Host_2500';
      try {
        let formId = "12400633174999288";
        formHost.deleteInvalidForms([formId], (error, data) => {
          if (error) {
            console.log(TAG + ' formHost deleteInvalidForms, error:' + JSON.stringify(error));
            expect(error.code).assertEqual(ERROR_CODE);
            done();
          } else {
            console.log(TAG + ' formHost deleteInvalidForms success');
          }
        });
      } catch (error) {
        console.log(`catch err->${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ERROR_CODE);
        done();
      }
    })

    /**
     * @tc.number: System_API_Test_Form_Host_2600
     * @tc.name: promise form deleteInvalidForms system interface interception test
     * @tc.desc:  Test the third-party application call deleteInvalidForms will be blocked
     * @tc.level   3
     */
    it('System_API_Test_Form_Host_2600',0, async function (done) {
      let TAG = 'System_API_Test_Form_Host_2600';
      try {
        let formId = "12400633174999288";
        formHost.deleteInvalidForms([formId])
          .then(() => {
            expect().assertFail();
            done();
          })
          .catch((error) => {
            console.log(TAG + ' formHost deleteInvalidForms, error:' + JSON.stringify(error));
            expect(error.code).assertEqual(ERROR_CODE);
            done();
          })
      } catch (error) {
        console.log(`catch err->${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ERROR_CODE);
        done();
      }
    })

    /**
     * @tc.number: System_API_Test_Form_Host_2700
     * @tc.name: callback form acquireFormState system interface interception test
     * @tc.desc:  Test the third-party application call acquireFormState will be blocked
     * @tc.level   3
     */
    it('System_API_Test_Form_Host_2700',0, async function (done) {
      let TAG = 'System_API_Test_Form_Host_2700';
      try {
        let want = {
          abilityName: "aaa",
          bundleName: "bbb"
        };
        formHost.acquireFormState(want, (error, data) => {
          if (error) {
            console.log(TAG + ' formHost acquireFormState, error:' + JSON.stringify(error));
            expect(error.code).assertEqual(ERROR_CODE);
            done();
          } else {
            console.log(TAG + ' formHost acquireFormState success');
          }
        });
      } catch (error) {
        console.log(`catch err->${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ERROR_CODE);
        done();
      }
    })

    /**
     * @tc.number: System_API_Test_Form_Host_2800
     * @tc.name: promise form acquireFormState system interface interception test
     * @tc.desc:  Test the third-party application call deleteForm will be blocked
     * @tc.level   3
     */
    it('System_API_Test_Form_Host_2800',0, async function (done) {
      let TAG = 'System_API_Test_Form_Host_2800';
      try {
        let want = {
          abilityName: "aaa",
          bundleName: "bbb"
        };
        formHost.acquireFormState(want)
          .then(() => {
            expect().assertFail();
            done();
          })
          .catch((error) => {
            console.log(TAG + ' formHost acquireFormState, error:' + JSON.stringify(error));
            expect(error.code).assertEqual(ERROR_CODE);
            done();
          })
      } catch (error) {
        console.log(`catch err->${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ERROR_CODE);
        done();
      }
    })

    /**
     * @tc.number: System_API_Test_Form_Host_2900
     * @tc.name: callback form on system interface interception test
     * @tc.desc:  Test the third-party application call on will be blocked
     * @tc.level   3
     */
    it('System_API_Test_Form_Host_2900',0, async function (done) {
      let TAG = 'System_API_Test_Form_Host_2900';
      try {
        formHost.on("formUninstall", (data) => {
          console.log(TAG + ` data->${JSON.stringify(data)}`);
          expect().assertFail();
          done();
        })
      } catch (error) {
        console.log(TAG + ` catch err->${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ERROR_CODE);
        done();
      }
    })

    /**
     * @tc.number: System_API_Test_Form_Host_3000
     * @tc.name: callback form off system interface interception test
     * @tc.desc:  Test the third-party application call off will be blocked
     * @tc.level   3
     */
    it('System_API_Test_Form_Host_3000',0, async function (done) {
      let TAG = 'System_API_Test_Form_Host_3000';
      try {
        formHost.off("formUninstall", (data) => {
          console.log(TAG + ` data->${JSON.stringify(data)}`);
          expect().assertFail();
          done();
        })
      } catch (error) {
        console.log(TAG + ` catch err->${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ERROR_CODE);
        done();
      }
    })

    /**
     * @tc.number: System_API_Test_Form_Host_3100
     * @tc.name: callback form notifyFormsVisible system interface interception test
     * @tc.desc:  Test the third-party application call notifyFormsVisible will be blocked
     * @tc.level   3
     */
    it('System_API_Test_Form_Host_3100',0, async function (done) {
      let TAG = 'System_API_Test_Form_Host_3100';
      try {
        let formId = "12400633174999288";
        formHost.notifyFormsVisible([formId], false, (error, data) => {
          if (error) {
            console.log(TAG + ' formHost notifyFormsVisible, error:' + JSON.stringify(error));
            expect(error.code).assertEqual(ERROR_CODE);
            done();
          } else {
            console.log(TAG + ' formHost notifyFormsVisible success');
          }
        });
      } catch (error) {
        console.log(`catch err->${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ERROR_CODE);
        done();
      }
    })

    /**
     * @tc.number: System_API_Test_Form_Host_3200
     * @tc.name: promise form notifyFormsVisible system interface interception test
     * @tc.desc:  Test the third-party application call notifyFormsVisible will be blocked
     * @tc.level   3
     */
    it('System_API_Test_Form_Host_3200',0, async function (done) {
      let TAG = 'System_API_Test_Form_Host_3200';
      try {
        let formId = "12400633174999288";
        formHost.notifyFormsVisible([formId], false)
          .then(() => {

          })
          .catch((error) => {
            console.log(TAG + ' formHost notifyFormsVisible, error:' + JSON.stringify(error));
            expect(error.code).assertEqual(ERROR_CODE);
            done();
          })
      } catch (error) {
        console.log(`catch err->${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ERROR_CODE);
        done();
      }
    })

    /**
     * @tc.number: System_API_Test_Form_Host_3300
     * @tc.name: callback form notifyFormsEnableUpdate system interface interception test
     * @tc.desc:  Test the third-party application call notifyFormsEnableUpdate will be blocked
     * @tc.level   3
     */
    it('System_API_Test_Form_Host_3300',0, async function (done) {
      let TAG = 'System_API_Test_Form_Host_3300';
      try {
        let formId = "12400633174999288";
        formHost.notifyFormsEnableUpdate([formId], false, (error, data) => {
          if (error) {
            console.log(TAG + ' formHost notifyFormsEnableUpdate, error:' + JSON.stringify(error));
            expect(error.code).assertEqual(ERROR_CODE);
            done();
          } else {
            console.log(TAG + ' formHost notifyFormsEnableUpdate success');
          }
        });
      } catch (error) {
        console.log(`catch err->${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ERROR_CODE);
        done();
      }
    })

    /**
     * @tc.number: System_API_Test_Form_Host_3400
     * @tc.name: promise form notifyFormsEnableUpdate system interface interception test
     * @tc.desc:  Test the third-party application call notifyFormsEnableUpdate will be blocked
     * @tc.level   3
     */
    it('System_API_Test_Form_Host_3400',0, async function (done) {
      let TAG = 'System_API_Test_Form_Host_3400';
      let formId = "12400633174999288";
      formHost.notifyFormsEnableUpdate([formId], false)
        .then(() => {
        })
        .catch((error) => {
          console.log(TAG + ' formHost notifyFormsEnableUpdate, error:' + JSON.stringify(error));
          expect(error.code).assertEqual(ERROR_CODE);
          done();
        })
    })

    /**
     * @tc.number: System_API_Test_Form_Host_3500
     * @tc.name: callback form shareForm system interface interception test
     * @tc.desc:  Test the third-party application call shareForm will be blocked
     * @tc.level   3
     */
    it('System_API_Test_Form_Host_3500',0, async function (done) {
      let TAG = 'System_API_Test_Form_Host_3500';
      try {
        let formId = "1337079774";
        let deviceId = "12400633174999288";
        formHost.shareForm(formId, deviceId, (error, data) => {
          if (error) {
            console.log(TAG + ' formHost shareForm, error:' + JSON.stringify(error));
            expect(error.code).assertEqual(ERROR_CODE);
            done();
          } else {
            console.log(TAG + ' formHost shareForm success');
          }
        });
      } catch (error) {
        console.log(TAG + ` catch err->${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ERROR_CODE);
        done();
      }
    })

    /**
     * @tc.number: System_API_Test_Form_Host_3600
     * @tc.name: promise form shareForm system interface interception test
     * @tc.desc:  Test the third-party application call shareForm will be blocked
     * @tc.level   3
     */
    it('System_API_Test_Form_Host_3600',0, async function (done) {
      let TAG = 'System_API_Test_Form_Host_3600';
      let formId = "1337079774";
      let deviceId = "12400633174999288";
      formHost.shareForm(formId, deviceId)
        .then(() => {
          expect().assertFail();
          done();
        })
        .catch((error) => {
          console.log(TAG + ' formHost shareForm, error:' + JSON.stringify(error));
          expect(error.code).assertEqual(ERROR_CODE);
          done();
        })
    })

    /**
     * @tc.number: System_API_Test_Form_Host_3700
     * @tc.name: callback form notifyFormsPrivacyProtected system interface interception test
     * @tc.desc:  Test the third-party application call notifyFormsPrivacyProtected will be blocked
     * @tc.level   3
     */
    it('System_API_Test_Form_Host_3700',0, async function (done) {
      let TAG = 'System_API_Test_Form_Host_3700';
      try {
        let formId = "12400633174999288";
        formHost.notifyFormsPrivacyProtected([formId], false, (error, data) => {
          if (error) {
            console.log(TAG + ' formHost notifyFormsPrivacyProtected, error:' + JSON.stringify(error));
            expect(error.code).assertEqual(ERROR_CODE);
            done();
          } else {
            console.log(TAG + ' formHost notifyFormsPrivacyProtected success');
          }
        });
      } catch (error) {
        console.log(`catch err->${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ERROR_CODE);
        done();
      }
    })

    /**
     * @tc.number: System_API_Test_Form_Host_3800
     * @tc.name: promise form notifyFormsPrivacyProtected system interface interception test
     * @tc.desc:  Test the third-party application call notifyFormsPrivacyProtected will be blocked
     * @tc.level   3
     */
    it('System_API_Test_Form_Host_3800',0, async function (done) {
      let TAG = 'System_API_Test_Form_Host_3800';
      try {
        let formId = "12400633174999288";
        formHost.notifyFormsPrivacyProtected([formId], false)
          .then(() => {

          })
          .catch((error) => {
            console.log(TAG + ' formHost notifyFormsPrivacyProtected, error:' + JSON.stringify(error));
            expect(error.code).assertEqual(ERROR_CODE);
            done();
          })
      } catch (error) {
        console.log(`catch err->${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ERROR_CODE);
        done();
      }
    })
  })
}

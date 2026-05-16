/**
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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

import hilog from '@ohos.hilog'
import rpc from '@ohos.rpc';
import ServiceExtensionAbility from '@ohos.app.ability.ServiceExtensionAbility';
import Want from '@ohos.app.ability.Want';
import account from '@ohos.account.appAccount';
import { BusinessError, RecordData } from '@ohos.base'

let tag: string = 'testTag';

let accountLabels: Record<string, Array<string>> = {
  'zhangsan': ['male', '30-40', 'level4'],
  'lisi': ['female']
};
let accountCredentials: Record<string, Record<string, string>> = {
  'zhangsan': {
    'PIN': '123456',
    'NUMBER': '12356789'
  },
  'lisi': {
    'FACE': 'X00001'
  }
};
let accountRemovability: Record<string, boolean> = {
  'zhangsan': false,
  'lisi': true
};

class MyAuthenticator extends account.Authenticator {
  createAccountImplicitly(options: account.CreateAccountImplicitlyOptions, callback: account.AuthCallback) {
    hilog.info(0x0000, tag, '====>[Authenticator] options: ' + JSON.stringify(options));
    let accountMgr: account.AppAccountManager = account.createAppAccountManager();
    let newAccountName: string = 'createNewAccountName';
    let wantInfo: Want = {
      bundleName: 'com.acts.accountauthenticator.static',
      abilityName: 'EntryAbility'
    }
    accountMgr.createAccount(newAccountName, (err: BusinessError<void> | null) => {
      hilog.info(0x0000, tag, '====>[Authenticator] createAccount err: ' + JSON.stringify(err));
      if (err !== null && err.code === 12300004) {
        callback.onResult(12300007);
        callback.onRequestRedirected(wantInfo);
        return;
      }
      let authResult: account.AuthResult = {
        account: {
          name: newAccountName,
          owner: 'com.acts.accountauthenticator.static'
        }
      }
      callback.onResult(0, authResult);
    });
  }

  auth(name: string, authType: string, options: Record<string, RecordData>, callback: account.AuthCallback) {
    hilog.info(0x0000, tag, '====>[Authenticator] name: ' + name);
    hilog.info(0x0000, tag, '====>[Authenticator] authType: ' + authType);
    hilog.info(0x0000, tag, '====>[Authenticator] options: ' + JSON.stringify(options));
    if (name === 'notExistAccount') {
      callback.onResult(12300003);
      return;
    }
    let authResult: account.AuthResult = {
      account: {
        name: name,
        owner: 'com.acts.accountauthenticator.static'
      },
      tokenInfo: {
        authType: 'getSocialData',
        token: 'xxxxxxxxx',
        account: {
          name: name,
          owner: 'com.acts.accountauthenticator.static'
        }
      }
    }
    callback.onResult(0, authResult);
  }

  verifyCredential(name: string, options: account.VerifyCredentialOptions, callback: account.AuthCallback) {
    hilog.info(0x0000, tag, '====>[Authenticator] name: ' + name)
    hilog.info(0x0000, tag, '====>[Authenticator] options: ' + JSON.stringify(options))
    if (name === 'notExistAccount') {
      callback.onResult(12300003);
      return;
    }
    if (name == 'xiaoming') {
      callback?.onRequestContinued?.()
      return
    }
    let authResult: account.AuthResult = {
      account: {
        name: name,
        owner: 'com.acts.accountauthenticator.static'
      },
      tokenInfo: {
        authType: 'getSocialData',
        token: 'xxxxxxxxx',
        account: {
          name: name,
          owner: 'com.acts.accountauthenticator.static'
        }
      }
    }
    let credentialInfo: Record<string, string> | undefined;
    try {
      credentialInfo = accountCredentials[name]
    } catch (err) {
      hilog.info(0x0000, tag, '====>[Authenticator]  no credential')
      authResult!.tokenInfo!.token = 'false';
      callback.onResult(0, authResult);
      return;
    }
    if (options.credentialType == undefined || options.credential == undefined) {
      let parameter: Record<string, RecordData> = {
        'credentialType': options.credentialType as string,
        'credential': options.credential as string
      };
      let want: Want = {
        bundleName: 'com.acts.accountauthenticator.static',
        abilityName: 'VerifyAbility',
        parameters: parameter
      };
      callback.onRequestRedirected(want);
      return;
    }
    try {
      let tempCredential: string | undefined = options.credentialType?.toUpperCase();
      let credential: String | undefined;
      if (tempCredential != undefined) {
        credential = credentialInfo?.[tempCredential];
      }
      if (credential == options.credential) {
        authResult!.tokenInfo!.token = 'true';
        callback.onResult(0, authResult);
      } else {
        authResult!.tokenInfo!.token = 'false';
        callback.onResult(0, authResult);
      }
    } catch (err) {
      hilog.info(0x0000, tag, '====>[Authenticator]  check credential error');
      authResult!.tokenInfo!.token = 'false';
      callback.onResult(0, authResult);
    }
  }

  setProperties(options: account.SetPropertiesOptions, callback: account.AuthCallback) {
    hilog.info(0x0000, tag, '====>[Authenticator] options: ' + JSON.stringify(options));
    try {
      let prop = options.properties as Record<string, RecordData>;
      let prop1 = prop['prop1'] as string;
      let prop2 = prop['prop2'] as string;
      if (prop1 == 'remove') {
        let appAccountMgr = account.createAppAccountManager();
        hilog.info(0x0000, tag, '====>[Authenticator] start remove ' + JSON.stringify(prop2));
        try {
          await appAccountMgr.removeAccount(prop2);
          hilog.info(0x0000, tag, '====>[Authenticator] remove appaccount success');
          callback.onResult(0);
          return;
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, '====>[Authenticator] removeAccount err: ' + JSON.stringify(err));
        }
      }
      callback.onResult(10016, {});
    } catch (err) {
      hilog.info(0x0000, tag, '====>[Authenticator] error: ' + JSON.stringify(err))
      callback.onResult(10016, {});
    }
  }

  checkAccountLabels(name: string, labels: Array<string>, callback: account.AuthCallback) {
    hilog.info(0x0000, tag, '====>[Authenticator] name: ' + name);
    hilog.info(0x0000, tag, '====>[Authenticator] labels: '+ labels);
    let authResult: account.AuthResult = {
      account: {
        name: name,
        owner: 'com.acts.accountauthenticator.static'
      },
      tokenInfo: {
        authType: 'getSocialData',
        token: 'xxxxxxxxx',
        account: {
          name: name,
          owner: 'com.acts.accountauthenticator.static'
        }
      }
    }
    if (name === 'notExistAccount') {
      callback.onResult(12300003);
      return;
    }
    if (labels.length == 0) {
      authResult!.tokenInfo!.token = 'true';
      callback.onResult(0, authResult)
      return
    }
    let allLabels: Array<string> | undefined;
    try {
      allLabels = accountLabels[name];
    } catch (err) {
      hilog.info(0x0000, tag, '====>[Authenticator] no labels');
      allLabels == undefined
    }
    if (allLabels == undefined || allLabels.length == 0) {
      authResult!.tokenInfo!.token = 'false';
      callback.onResult(0, undefined);
      return;
    }
    for (let i = 0; i < labels.length; ++i) {
      if (allLabels.indexOf(labels[i]) == -1) {
        authResult!.tokenInfo!.token = 'false';
        callback.onResult(0, undefined);
        return;
      }
    }
    authResult!.tokenInfo!.token = 'true';
    callback.onResult(0, authResult)
  }

  checkAccountRemovable(name: string, callback: account.AuthCallback) {
    hilog.info(0x0000, tag, '====>[Authenticator] name: ' + name);
    let isRemovable: Boolean | undefined = false;
    try {
      isRemovable = accountRemovability[name];
    } catch (err) {
      hilog.info(0x0000, tag, '====>[Authenticator] error: ' + JSON.stringify(err))
    }
    let authResult: account.AuthResult = {
      account: {
        name: name,
        owner: 'com.acts.accountauthenticator.static'
      },
      tokenInfo: {
        authType: 'getSocialData',
        token: 'xxxxxxxxx',
        account: {
          name: name,
          owner: 'com.acts.accountauthenticator.static'
        }
      }
    }
    callback.onResult(0, undefined);
  }
}

export default class ServiceExtAbility extends ServiceExtensionAbility {
  onCreate(want: Want) {
    hilog.info(0x0000, 'testTag', '%{public}s', 'ServiceExtensionAbility onCreate');
    hilog.info(0x0000, 'testTag', '%{public}s', 'want param:' + JSON.stringify(want) ?? '');
  }

  onRequest(want: Want, startId: number) {
    hilog.info(0x0000, 'testTag', '%{public}s', 'ServiceExtensionAbility onRequest');
    hilog.info(0x0000, 'testTag', '%{public}s', 'want param:' + JSON.stringify(want) ?? '');
    hilog.info(0x0000, 'testTag', '%{public}s', 'startId param:' + JSON.stringify(startId) ?? '');
  }

  onConnect(want: Want): rpc.RemoteObject | Promise<rpc.RemoteObject> {
    hilog.info(0x0000, 'testTag', '%{public}s', 'ServiceExtensionAbility onConnect');
    hilog.info(0x0000, 'testTag', '%{public}s', 'want param:' + JSON.stringify(want) ?? '');
    let authenticator: account.Authenticator = new MyAuthenticator();
    return authenticator.getRemoteObject();
  }

  onDisconnect(want: Want): Promise<void> | undefined {
    hilog.info(0x0000, 'testTag', '%{public}s', 'ServiceExtensionAbility onDisconnect');
    hilog.info(0x0000, 'testTag', '%{public}s', 'want param:' + JSON.stringify(want) ?? '');
    return Promise.resolve();
  }

  onDestroy() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
  }
}
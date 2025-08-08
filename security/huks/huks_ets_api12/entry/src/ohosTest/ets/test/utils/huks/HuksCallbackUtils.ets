import { huks } from '@kit.UniversalKeystoreKit';


export async function generateKeyItem(keyAlias: string, options: huks.HuksOptions): Promise<void> {
  return new Promise((resolve, reject) => {
    huks.generateKeyItem(keyAlias, options, (err, data) => {
      if (err) {
        reject(err);
      }
      resolve(data);
    })
  })
}

export async function deleteKeyItem(keyAlias: string, options: huks.HuksOptions): Promise<void> {
  return new Promise((resolve, reject) => {
    huks.deleteKeyItem(keyAlias, options, (err, data) => {
      if (err) {
        reject(err);
      }
      resolve(data);
    })
  })
}

export async function importKeyItem(keyAlias: string, options: huks.HuksOptions): Promise<void> {
  return new Promise((resolve, reject) => {
    huks.importKeyItem(keyAlias, options, (err, data) => {
      if (err) {
        reject(err);
      }
      resolve(data);
    })
  })
}

export async function importWrappedKeyItem(keyAlias: string, wrappingKeyAlias: string, options: huks.HuksOptions): Promise<void> {
  return new Promise((resolve, reject) => {
    huks.importWrappedKeyItem(keyAlias, wrappingKeyAlias, options, (err, data) => {
      if (err) {
        reject(err);
      }
      resolve(data);
    })
  })
}

export async function exportKeyItem(keyAlias: string, options: huks.HuksOptions): Promise<huks.HuksReturnResult> {
  return new Promise((resolve, reject) => {
    huks.exportKeyItem(keyAlias, options, (err, data) => {
      if (err) {
        reject(err);
      }
      resolve(data);
    })
  })
}

export async function getKeyItemProperties(keyAlias: string, options: huks.HuksOptions): Promise<huks.HuksReturnResult> {
  return new Promise((resolve, reject) => {
    huks.getKeyItemProperties(keyAlias, options, (err, data) => {
      if (err) {
        reject(err);
      }
      resolve(data);
    })
  })
}

export async function isKeyItemExist(keyAlias: string, options: huks.HuksOptions): Promise<boolean> {
  return new Promise((resolve, reject) => {
    huks.isKeyItemExist(keyAlias, options, (err, data) => {
      if (err) {
        reject(err);
      }
      resolve(data);
    })
  })
}

export async function hasKeyItem(keyAlias: string, options: huks.HuksOptions): Promise<boolean> {
  return new Promise((resolve, reject) => {
    huks.hasKeyItem(keyAlias, options, (err, data) => {
      if (err) {
        reject(err);
      }
      resolve(data);
    })
  })
}

export async function initSession(keyAlias: string, options: huks.HuksOptions): Promise<huks.HuksSessionHandle> {
  return new Promise((resolve, reject) => {
    huks.initSession(keyAlias, options, (err, data) => {
      if (err) {
        reject(err);
      }
      resolve(data);
    })
  })
}

export async function updateSession(handle: number, options: huks.HuksOptions): Promise<huks.HuksReturnResult> {
  return new Promise((resolve, reject) => {
    huks.updateSession(handle, options, (err, data) => {
      if (err) {
        reject(err);
      }
      resolve(data);
    })
  })
}

export async function finishSession(handle: number, options: huks.HuksOptions): Promise<huks.HuksReturnResult> {
  return new Promise((resolve, reject) => {
    huks.finishSession(handle, options, (err, data) => {
      if (err) {
        reject(err);
      }
      resolve(data);
    })
  })
}

export async function abortSession(handle: number, options: huks.HuksOptions): Promise<void> {
  return new Promise((resolve, reject) => {
    huks.abortSession(handle, options, (err, data) => {
      if (err) {
        reject(err);
      }
      resolve(data);
    })
  })
}

export async function anonAttestKeyItem(keyAlias: string, options: huks.HuksOptions): Promise<huks.HuksReturnResult> {
  return new Promise((resolve, reject) => {
    huks.anonAttestKeyItem(keyAlias, options, (err, data) => {
      if (err) {
        reject(err);
      }
      resolve(data);
    })
  })
}

export async function update(handle: number, token: Uint8Array | undefined, options: huks.HuksOptions): Promise<huks.HuksReturnResult> {
  return new Promise((resolve, reject) => {
    huks.update(handle, token, options, (err, data) => {
      if (err) {
        reject(err);
      }
      resolve(data);
    })
  })
}

import { expect } from '../../../../hypium/index';
import hilog from '@ohos.hilog';
import { BusinessError, AsyncCallback, Callback, RecordData } from '@ohos.base';
import Want from '@ohos.app.ability.Want';
import formHost from '@ohos.app.form.formHost';
import formProvider from '@ohos.app.form.formProvider';
import formInfo from '@ohos.app.form.formInfo';
import emitter from '@ohos.events.emitter';
import Utils from '../../../src/test/Util.test';

const DOMAIN: Int = 0x0000;
const TAG: string = 'FormHostTestController';
const FALSE_TEST_OFFSET: Long = 1000;
const TEST_FINISH_OFFSET: Long = 2000;

export enum EventIdMap {
  AddFormWithPromise = 100,
  DeleteFormWithCallback,
  DeleteFormWithPromise,
  ReleaseFormWithPromise,
  ReleaseFormWithCacheCallback,
  ReleaseFormWithCallback,
  RequestFormWithPromise,
  RequestFormWithCallback,
  RequestFormWithParamsPromise,
  CastToNormalFormWithCallback,
  CastToNormalFormWithPromise,
  NotifyVisibleFormsWithPromise,
  NotifyVisibleFormsWithCallback,
  NotifyInvisibleFormsWithPromise,
  NotifyInvisibleFormsWithCallback,
  EnableFormsUpdateWithCallback,
  EnableFormsUpdateWithPromise,
  DisableFormsUpdateWithPromise,
  DisableFormsUpdateWithCallback,
  IsSystemReadyWithCallback,
  IsSystemReadyWithPromise,
  GetAllFormsInfoWithPromise,
  GetAllFormsInfoWithCallback,
  GetFormsInfoWithFilterPromise,
  GetFormsInfoWithBundleModuleCallback,
  GetFormsInfoWithBundleModulePromise,
  GetFormsInfoWithBundleCallback,
  DeleteInvalidFormsWithPromise,
  DeleteInvalidFormsWithCallback,
  AcquireFormStateWithPromise,
  AcquireFormStateWithCallback,
  OnFormUninstallWithoutString,
  OffFormUninstallWithoutString,
  NotifyFormsVisibleWithCallback,
  NotifyFormsVisibleWithPromise,
  NotifyFormsEnableUpdateWithPromise,
  NotifyFormsEnableUpdateWithCallback,
  ShareFormWithPromise,
  ShareFormWithCallback,
  NotifyFormsPrivacyProtectedWithCallback,
  NotifyFormsPrivacyProtectedWithPromise,
  AcquireFormDataWithCallback,
  AcquireFormDataWithPromise,
  SetRouterProxyWithPromise,
  SetRouterProxyWithCallback,
  ClearRouterProxyWithCallback,
  ClearRouterProxyWithPromise,
  SetPublishFormResult,
  SetFormsRecyclableWithPromise,
  SetFormsRecyclableWithCallback,
  RecycleFormsWithPromise,
  RecoverFormsWithPromise,
  RecoverFormsWithCallback,
  UpdateFormLocation,
  UpdateFormLockedStateWithPromise
}

export class FormHostTestController {
  // -----------------------------
  // Internal helpers
  // -----------------------------

  createEventData(isSuccess: boolean): emitter.EventData {
    let data: Record<String, RecordData> = {
      'isSuccess': isSuccess 
    };

    let eventData: emitter.EventData = {
      data: data
    };
    return eventData;
  }

  getTestEvent(evId: EventIdMap): emitter.InnerEvent {
    let event: emitter.InnerEvent = {
      eventId: evId as Long,
      priority: emitter.EventPriority.IMMEDIATE
    }
    return event;
  }

  getFinishEvent(evId: EventIdMap): emitter.InnerEvent { 
    let event: emitter.InnerEvent = {
      eventId: (evId + TEST_FINISH_OFFSET) as Long,
      priority: emitter.EventPriority.IMMEDIATE
    }
    return event;
  }

  getFalseTestEvent(evId: EventIdMap): emitter.InnerEvent { 
    let event: emitter.InnerEvent = {
      eventId: (evId + FALSE_TEST_OFFSET) as Long,
      priority: emitter.EventPriority.IMMEDIATE
    }
    return event;
  }

  emitFinished(eventId: EventIdMap, result: boolean) {
    hilog.info(DOMAIN, TAG, `emitting event, result: ${result}`);
    emitter.emit(this.getFinishEvent(eventId), this.createEventData(result));
  }

  emitStart(evId: EventIdMap, falseTest: boolean = false) {
    let eventData: emitter.EventData = {
      data: {}
    };
    if(falseTest) {
      emitter.emit(this.getFalseTestEvent(evId), eventData);
    } else {
      emitter.emit(this.getTestEvent(evId), eventData);
    }
  }
}

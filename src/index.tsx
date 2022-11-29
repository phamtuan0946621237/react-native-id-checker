import { NativeModules, Platform } from 'react-native';


const LINKING_ERROR =
  `The package 'react-native-id-checker' doesn't seem to be linked. Make sure: \n\n` +
  Platform.select({ ios: "- You have run 'pod install'\n", default: '' }) +
  '- You rebuilt the app after installing the package\n' +
  '- You are not using Expo Go\n';

const IdChecker = NativeModules.IdChecker
  ? NativeModules.IdChecker
  : new Proxy(
    {},
    {
      get() {
        throw new Error(LINKING_ERROR);
      },
    }
  );

//   const CalendarModule = NativeModules.Calendar
// ? NativeModules.Calendar
// : new Proxy(
//     {},
//     {
//       get() {
//         throw new Error(LINKING_ERROR);
//       },
//     }
//   );

export function multiply(a: number, b: number): Promise<number> {
  return IdChecker.multiply(a, b);
}

export function checkIdInfo({
  handleCallback
}: {
  handleCallback: (value: any) => void
}) {
  IdChecker.checkId((value: any) => {
    // console.log("heslo basby_____ :: ",value)
    if(!value) return
    handleCallback(value)
  })
}

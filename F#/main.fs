open System

let rotateString toEncode : string =
  toEncode
  |> Array.ofSeq
  |> Array.map (
    int >> (
      fun ch ->
        match ch with
        | ch when (ch >= 65 && ch <= 77) || (ch >= 97 && ch <= 109) -> ch + 13
        | ch when (ch >= 78 && ch <= 90) || (ch >= 110 && ch <= 122) -> ch - 13
        | _ -> ch
      ) >> char
  )
  |> System.String

[<EntryPoint>]
let main argv : int =
  printfn "Enter string to encode:"
  let toEncode = Console.ReadLine ()
  printfn "Encoded string:"
  printfn "%s" (rotateString toEncode)
  0

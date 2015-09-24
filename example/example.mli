open Core.Std

type t = {
  a : float;
  b : string;
  c : int;
  e : Date.t;
} [@@deriving csv, fields]


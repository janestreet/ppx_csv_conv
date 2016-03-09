open! Core.Std

type t = {
  a : float;
  b : string;
  c : int;
  d : Date.t;
} [@@deriving csv, fields]

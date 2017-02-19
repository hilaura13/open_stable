export const RECEIVE_ALL_FAVORITES = "RECEIVE_ALL_FAVORITES";
export const RECEIVE_SINGLE_FAVORITE = "RECEIVE_SINGLE_FAVORITE";
export const REMOVE_SINGLE_FAVORITE = "REMOVE_SINGLE_FAVORITE";
export const REMOVE_ALL_FAVORITES = "REMOVE_ALL_FAVORITES";

const receiveAllFavorites = favorites => ({
  type: RECEIVE_ALL_FAVORITES,
  favorites
});

const receiveSingleFavorite = favorite => ({
  type: RECEIVE_SINGLE_FAVORITE,
  favorite
});
